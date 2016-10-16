class RenameAttendees < ActiveRecord::Migration
  def change
    change_table :attendees do |t|
     t.rename :clasroom_id, :classroom_id
    end

  end
end
