class UserTexter < Textris::Base
  default :from => ENV["TWILIO_FROM_NUMBER"]
 
  def welcome_confirm(user)
    @user = user

    text :to => @user.normalized
  end
end