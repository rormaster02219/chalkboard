class Subscription < ActiveRecord::Base

  belongs_to :student
  validates :student_id, presence: true
  attr_accessor :stripe_card_token
end
