class AddHostToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :hostedBy, :string
  end
end
