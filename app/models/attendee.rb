class Attendee < ActiveRecord::Base

  belongs_to :student
  belongs_to :classroom

end
