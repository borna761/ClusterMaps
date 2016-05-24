class AddTeachertutoranimatorToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :teacherTutorAnimator, :string
  end
end
