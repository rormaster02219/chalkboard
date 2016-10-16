class Question < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_solution, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :choice_a_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :choice_b_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :choice_c_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :choice_d_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image_solution, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :choice_a_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :choice_b_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :choice_c_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :choice_d_image, :content_type => /\Aimage\/.*\Z/
  
  has_many :results
  has_many :students, through: :results  

end
