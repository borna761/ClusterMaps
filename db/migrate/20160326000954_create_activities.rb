class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.date :startDate
      t.string :location
      t.integer :participants, :default => 0
      t.text :comments
      t.references :activity_type, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
