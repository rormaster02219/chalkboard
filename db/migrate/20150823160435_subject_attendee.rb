class SubjectAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :subject, :string
  end
end
