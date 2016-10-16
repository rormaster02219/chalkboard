class ClassroomsActive < ActiveRecord::Migration
  def change
add_column :classrooms, :status, :text
  end
end
