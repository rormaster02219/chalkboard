class AddClassnameClassroom < ActiveRecord::Migration
  def change
        add_column :classrooms, :classname, :string
  end
end
