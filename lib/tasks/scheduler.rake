desc "This task is called by the Heroku scheduler add-on to send notifications."
task :send_all => :environment do
  Notification.send_all
  puts "Notifications have been sent"
end
