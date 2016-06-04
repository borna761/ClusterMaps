class AddOwnerToClusters < ActiveRecord::Migration
  def change
    add_reference :clusters, :owner, references: :users, index: true
    add_foreign_key :clusters, :users, column: :owner_id
  end
end
