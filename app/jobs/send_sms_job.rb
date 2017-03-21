# Job to send daily SMS to users
class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(time_of_day)
    logger.info "Starting sending messages for #{timeOfDay}"
    users = find_users(time_of_day)
    logger.info "Found #{users.count} users to send messages for"
    send_messages(users)
    logger.info "Finished sending messages"
  end

  def find_users(time_of_day)
    case time_of_day
    when "morning"
      User.morning_users
    when "afternoon"
      User.afternoon_users
    when "evening"
      User.evening_users
    else
      User.active
    end
  end

  def send_messages(users)
    logger.info "Gathering all users"
    users.each do |u|
      logger.info "Starting algorithm for user_id: #{u.id}"
      # Get the Course(s) that the user is subscribed to(returns array)
      user_courses = u.active_courses
      user_courses.each do |uc|
        logger.info "Course found. Course_id: #{uc.course_id}"
        logger.info "Finding lessons that the user has completed for course"
      end
    end
  end
end
