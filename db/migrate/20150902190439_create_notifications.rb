class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notification_time
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
