require 'valid_email'
class Student < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, :email => true

  has_secure_password
  
  validates :password, :length => { :within => 6..40 }, :if => :password_blank?

  validates_confirmation_of :password,
    if: lambda { |m| m.password.present? }
 
  has_many :trackings 
  has_many :results
  has_many :questions, through: :results

  has_many :attendees
  has_many :classrooms, :through => :attendees

  def password_blank?
    
    !@password.blank?
  end

  def custom_update_attributes(params)
        

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      update_attributes params
    end
  end

  def Student.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def generate_token(column)


    self[column] = SecureRandom.urlsafe_base64
  end

  def Student.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      
      self.remember_token = Student.encrypt(Student.new_remember_token)
      self.activation_token = generate_token(:activation_token)
    end

end
