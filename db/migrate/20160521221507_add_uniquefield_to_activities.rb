class AddUniquefieldToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :uniquefield, :string
  end
end
