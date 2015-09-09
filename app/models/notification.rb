class Notification < ActiveRecord::Base

  validates_presence_of :notification_time
  validates_presence_of :event_id
  belongs_to :event

end
