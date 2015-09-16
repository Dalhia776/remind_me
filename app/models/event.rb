class Event < ActiveRecord::Base

  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :reminder_type
  validates_presence_of :date_time
  validates_presence_of :description
  
  belongs_to :user
  has_many :notifications

  after_save :create_notifications

  scope :text, -> {where(reminder_type: 'text')}
  scope :email, -> {where(reminder_type: 'email')}
  scope :both, -> {where(reminder_type: 'both')}


  def create_notifications
    self.notifications.destroy_all
    self.notifications << Notification.new(:notification_datetime => 2.weeks.until(self.date_time), :message => "This is your 2 week reminder - #{self.description} for #{self.name}.")
    self.notifications << Notification.new(:notification_datetime => 1.week.until(self.date_time), :message => "This is your 1 week reminder - #{self.description} for #{self.name}.")
    self.notifications << Notification.new(:notification_datetime => 2.days.until(self.date_time), :message => "This is your 2 day reminder - #{self.description} for #{self.name}.")
  end

end
