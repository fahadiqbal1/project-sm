class User < ApplicationRecord
  devise :database_authenticatable, :lockable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  before_create :create_otp_code
  after_create :send_otp_code
  
  validates :phone_number, :uniqueness => true, numericality: true
  validates :encrypted_password, length: { minimum: 6 }

  def email_required?
    false
  end
  
  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && otp_confirmed?
  end

  private
  
  def otp_confirmed?
    self.otp_confirmed_at ? true : false
  end
  
  def create_otp_code
    self.otp = SecureRandom.base58(5)
    self.otp_timestamp = Time.now
  end
  
  def send_otp_code
    byebug
  end
  
end
