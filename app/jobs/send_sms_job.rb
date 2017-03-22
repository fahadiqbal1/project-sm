# Job to send daily SMS to users
class SendSmsJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do |exception|
    logger.error exception.message
  end

  def perform(number, message)
    UserTexter.send_message(number, message).deliver
  rescue Twilio::REST::RequestError => e
    logger.error "Could not send message for phone #{number}"
    logger.error e.message
  end
end
