class AddDefaultToClusterUsers < ActiveRecord::Migration
  def change
    add_column :cluster_users, :default, :boolean
  end
end
