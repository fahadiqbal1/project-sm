# Job to send daily SMS to users
class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later
    logger.info "Test"
  end
end
