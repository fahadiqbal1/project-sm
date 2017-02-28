# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  phone_number           :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  otp                    :string
#  otp_timestamp          :datetime
#  otp_confirmed_at       :datetime
#  phone_dial_code        :integer          default("1")
#
class User < ApplicationRecord
  devise :database_authenticatable, :lockable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :user_preference, :dependent => :destroy
  has_many :user_languages
  has_many :languages, :through => :user_languages
  has_many :user_courses
  has_many :courses, :through => :user_courses

  accepts_nested_attributes_for :user_preference, :allow_destroy => true
  accepts_nested_attributes_for :user_languages, :allow_destroy => true
  accepts_nested_attributes_for :user_courses, :allow_destroy => true

  before_create :create_otp_code, :build_default_user_preference
  after_create :send_otp_code

  validates :phone_number,
            :uniqueness => { :scope => :phone_dial_code },
            :numericality => true
  validates :encrypted_password, :length => { :minimum => 6 }
  validates :phone_dial_code, :presence => true, :numericality => true
  validate :phone_number_plausibility

  def to_s
    phone_number
  end

  def email_required?
    false
  end

  def normalized
    Phony.normalize("+#{phone_dial_code}#{phone_number}")
  rescue
    errors.add(:phone_dial_code, "invalid")
  end

  def active_for_authentication?
    # Uncomment the below debug statement to view
    # the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && otp_confirmed?
  end

  def confirm_user
    self.otp_confirmed_at = Time.now.utc
  end

  def otp_confirmed?
    otp_confirmed_at ? true : false
  end

  private

  def phone_number_plausibility
    errors.add(:phone_number, I18n.t("activerecord.attributes.user.phone_number_plausibility")) unless Phony.plausible?(normalized) # rubocop:disable Metrics/LineLength
  end

  def build_default_user_preference
    build_user_preference
    true
  end

  def create_otp_code
    self.otp = SecureRandom.base58(5)
    self.otp_timestamp = Time.now.utc
    true
  end

  def send_otp_code
    UserTexter.welcome_confirm(self).deliver
  rescue Twilio::REST::RequestError => e
    errors.add(:phone_number, e.message)
  end
end
