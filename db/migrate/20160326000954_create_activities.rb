class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.date :startDate
      t.string :location
      t.integer :participants
      t.text :comments
      t.integer :activity_type_id
      t.timestamps null: false
    end
  end
end
