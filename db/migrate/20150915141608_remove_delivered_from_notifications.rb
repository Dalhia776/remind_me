class RemoveDeliveredFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :delivered, :boolean
  end
end
