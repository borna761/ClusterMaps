class AddFrequencyToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :frequencyValue, :integer
    add_column :activities, :frequencyUnit, :string
  end
end
