class User < ApplicationRecord
  devise :database_authenticatable, :lockable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :language
  
  before_create :create_otp_code
  after_create :send_otp_code
  
  validates :phone_number, uniqueness: { scope: :phone_dial_code } , numericality: true
  validates :encrypted_password, length: { minimum: 6 }
  validates :phone_dial_code, presence: true, numericality: true
  validate :phone_number_plausibility

  def to_s
    phone_number
  end

  def email_required?
    false
  end
  
  def normalized
    Phony.normalize("+#{self.phone_dial_code}#{self.phone_number}")
  end
  
  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && otp_confirmed?
  end

  private
  
  def phone_number_plausibility
    valid = Phony.plausible?(normalized)
    errors.add(:phone_number, I18n.t('activerecord.attributes.user.phone_number_plausibility')) unless valid
  end
  
  def otp_confirmed?
    self.otp_confirmed_at ? true : false
  end
  
  def create_otp_code
    self.otp = SecureRandom.base58(5)
    self.otp_timestamp = Time.now
  end
  
  def send_otp_code
    begin
      UserTexter.welcome_confirm(self).deliver
    rescue Twilio::REST::RequestError => e
      errors.add(:phone_number, e.message )
    end
  end
  
end
