class AddSubjectClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :subject, :string
  end
end
