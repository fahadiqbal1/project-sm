class User < ApplicationRecord
  devise :database_authenticatable, :lockable, 
         :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  after_create :send_code
  
  private
  
  def send_code
    update_attribute( :otp, (0..9).to_a.shuffle[0,5].join)
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{self.otp}<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  end
end
