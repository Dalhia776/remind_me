class ChangeDateDueInEvents < ActiveRecord::Migration
  def change
    remove_column :events, :date_due
    add_column :events, :date_time, :datetime
  end
end
