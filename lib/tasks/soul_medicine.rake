namespace :soul_medicine do
  desc "This task does nothing"
  task :nothing do
    puts "Hi! Nothing was done here :D"
  end

  desc "Confirm Sidekiq is running"
  task :sidekiq_check do
    redis_info = Sidekiq.redis(&:info)
    puts redis_info["connected_clients"]
  end

  desc "Send messages to users"
  task :send_messages, [:timeOfDay] => :environment do |_task, args|
    # MessageSendAlgorithmWorker.perform_async(args.timeOfDay)
    puts ">>>>> #{args.timeOfDay} <<<<<"
    SendSmsJob.perform_later args.timeOfDay
  end
end
