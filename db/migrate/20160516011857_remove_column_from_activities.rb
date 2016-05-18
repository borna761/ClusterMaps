class RemoveColumnFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :location, :string
  end
end
