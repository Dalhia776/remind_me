class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :user_id
      t.string :reminder_type
      t.string :date_due

      t.timestamps null: false
    end
  end
end
