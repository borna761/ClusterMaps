class RemoveStartDateFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :startDate, :string
  end
end
