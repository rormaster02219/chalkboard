class SessionsController < ApplicationController
 skip_before_filter :verify_authenticity_token  
  def new
    if !signed_in? 
      @student = Student.new
    else
      redirect_to static_pages_home_path 
    end  
  end

  def create
    @student = Student.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    sign_out
    redirect_to static_pages_home_path
  end
  
  def reset_password
    
    @email = params[:email]
    
    if Student.all.collect(&:email).include? params[:email]
      @student=Student.find_by_email(params[:email])
      StudentMailer.reset_password(@student).deliver
    end
    respond_to do |format|
      format.js
    end
  end


end
