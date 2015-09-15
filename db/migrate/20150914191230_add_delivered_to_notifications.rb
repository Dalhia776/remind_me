class AddDeliveredToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :delivered, :boolean, :defaut => false
  end
end
