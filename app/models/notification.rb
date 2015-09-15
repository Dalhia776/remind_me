class Notification < ActiveRecord::Base

  validates_presence_of :notification_datetime
  validates_presence_of :event_id
  validates_presence_of :message

  belongs_to :event

  scope :two_weeks_before, lambda{|date_time| where('notification_datetime between ? and ?', 2.weeks.until(self.event.date_time), self.event.date_time)}
  scope :one_week_before, lambda{|the_date| where('notification_datetime between ? and ?', 1.week.until(self.event.date_time), self.event.date_time)}
  scope :two_days_before, lambda{|the_date| where('notification_datetime between ? and ?', 2.days.until(self.event.date_time), self.event.date_time)}
  scope :undelivered, -> {where(:delivered => false)}
  scope :needs_sent, -> {where('notification_datetime < ?', Time.now)}


  def text
    @twilio_number = ENV['twilio_number']
    @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
    time_str = ((self.event.date_time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = self.message
    message = @client.messages.create(
      :from => @twilio_number,
      :to => '+17656358422',
      :body => reminder
    )
    puts message.to
  end

  def self.send_all
    undelivered.needs_sent.each do |notify|
      if notify.event.reminder_type == 'text'
        notify.text
      elsif notify.event.reminder_type == 'email'
        NotificationMailer.notification_email(notify).deliver
      elsif notify.event.reminder_type == 'both'
        notify.text
        NotificationMailer.notification_email(notify).deliver
      end
      notify.update(:delivered => true)
    end
  end

end
