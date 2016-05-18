class AddColumnsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :latitude, :string
    add_column :activities, :longitude, :string
  end
end
