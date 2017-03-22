# User Texter - The method that is used to text the user
class UserTexter < Textris::Base
  default :from => "Soul Medicine <#{ENV['TWILIO_FROM_NUMBER']}>"

  def welcome_confirm(user)
    @user = user
    text :to => "+#{@user.normalized}"
  end

  def send_message(number, message)
    @message = message
    text :to => number
  end
end
