class AddIconToActivityTypes < ActiveRecord::Migration
  def change
    add_column :activity_types, :icon, :string
  end
end
