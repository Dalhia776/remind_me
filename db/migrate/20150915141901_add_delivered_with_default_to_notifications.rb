class AddDeliveredWithDefaultToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :delivered, :boolean, :default => false
  end
end
