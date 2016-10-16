class Classroom < ActiveRecord::Base
  has_many :attendees
  has_many :students, :through => :attendees

end
