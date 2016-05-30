class CreateClusterUsers < ActiveRecord::Migration
  def change
    create_table :cluster_users do |t|
      t.references :cluster, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
