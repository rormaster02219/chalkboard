class ChangeClassroomStatus < ActiveRecord::Migration
  def change
    change_column :classrooms, :status, :string
  end
end
