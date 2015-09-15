class Event < ActiveRecord::Base

  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :reminder_type
  validates_presence_of :date_time
  belongs_to :user
  has_many :notifications
  after_save :create_notifications
  # after_save :update_notification
  scope :text, -> {where(reminder_type: 'text')}
  scope :email, -> {where(reminder_type: 'email')}
  scope :both, -> {where(reminder_type: 'both')}


  def create_notifications
    self.notifications << Notification.new(:notification_datetime => 2.weeks.until(self.date_time))
    self.notifications << Notification.new(:notification_datetime => 1.week.until(self.date_time))
    self.notifications << Notification.new(:notification_datetime => 2.days.until(self.date_time))
  end

  # def update_notification
  #   if @event.updated?
  #     self.notifications.destroy_all
  #   end
  #   self.create_notifications
  # end







end
