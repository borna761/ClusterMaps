class AddClusterIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :cluster_id, :integer
  end
end
