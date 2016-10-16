class AddColumnClassroom < ActiveRecord::Migration
  def change
        add_column :classrooms, :date_of, :datetime
  end
end
