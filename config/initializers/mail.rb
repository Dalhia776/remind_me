ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '25',
    :domain => 'dalhia.net',
    :authentication => :plain,
    :user_name => ENV['sendgrid_username'],
    :password => ENV['sendgrid_password']
  }

  SendGrid.configure do |config|
    config.dummy_recipient = 'support@dalhia.net'
  end
