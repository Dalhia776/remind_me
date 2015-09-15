class AddNotificationDatetimeToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :notification_datetime, :datetime
  end
end
