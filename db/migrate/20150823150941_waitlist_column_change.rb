class WaitlistColumnChange < ActiveRecord::Migration
  def change
     change_column :classrooms, :waitlist, :integer
  end

end
