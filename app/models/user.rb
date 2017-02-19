# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  phone_number           :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  language_id            :integer
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

  belongs_to :language

  before_create :create_otp_code
  after_create :send_otp_code

  validates :phone_number,
            :uniqueness => { :scope => :phone_dial_code },
            :numericality => true
  validates :encrypted_password, :length => { :minimum => 6 }
  validates :phone_dial_code, :presence => true, :numericality => true
  validate :language
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

  protected

  def confirm_user(otp_code)
    rtn = false
    if this.otp_confirmed?
      flash[:alert] = I18n.t "confirmation.already_confirmed"
    elsif otp_code.eql? this.otp
      self.otp_confirmed_at = Time.now.utc
      flash[:notice] = I18n.t "confirmation.code_confirmed"
      rtn = true
    else
      flash[:alert] = I18n.t "confirmation.code_not_correct"
    end
    rtn
  end

  private

  def phone_number_plausibility
    valid = Phony.plausible?(normalized)
    return unless valid
    errors.add(
      :phone_number,
      I18n.t("activerecord.attributes.user.phone_number_plausibility")
    )
  end

  def otp_confirmed?
    otp_confirmed_at ? true : false
  end

  def create_otp_code
    self.otp = SecureRandom.base58(5)
    self.otp_timestamp = Time.now.utc
  end

  def send_otp_code
    UserTexter.welcome_confirm(self).deliver
  rescue Twilio::REST::RequestError => e
    errors.add(:phone_number, e.message)
  end
end
