class NotificationMailer < ApplicationMailer
  default :from => 'lenore776@gmail.com',
          :subject => 'A notification email for you'

  def notification_email(notification)
    @user = notification.event.user
    @event = notification.event
    @notification = notification
    category 'NotificationEmails'
    mail :to => @user.email 
  end


end
