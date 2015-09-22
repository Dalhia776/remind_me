class NotificationMailer < ApplicationMailer
  default :from => 'support@dalhia.net',
          :subject => 'A notification email for you'

  def notification_email(notification)
    @user = notification.event.user
    @event = notification.event
    @notification = notification
    category 'NotificationEmails'
    mail :to => @user.email
  end


end
