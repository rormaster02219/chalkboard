class Result < ActiveRecord::Base

  belongs_to :question
  belongs_to :student
  validates :student_id, presence: true
  validates :question_id, presence: true
end
