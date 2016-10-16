module SessionsHelper

  def sign_in_user(student)
    remember_token = Student.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    student.update_attribute(:remember_token, Student.encrypt(remember_token))
    self.current_student = student
  end

  def signed_in?
    
    !current_student.nil?
  end

  def current_student=(student)
    @current_student = student
  end

  def current_student
    remember_token = Student.encrypt(cookies[:remember_token])
    @current_student ||= Student.find_by(remember_token: remember_token)
  end

  def current_student?(student)
    student == current_student
  end

  def sign_out
    self.current_student = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

end
