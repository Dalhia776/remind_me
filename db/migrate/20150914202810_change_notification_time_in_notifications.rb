class ChangeNotificationTimeInNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :notification_time, :string
  end
end
