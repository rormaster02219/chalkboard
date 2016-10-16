class StudentsController < ApplicationController
  before_action :signed_in_student, only: [:edit, :update]
  before_action :correct_student,   only: [:edit, :update]
  skip_before_filter :verify_authenticity_token
  def new
    if !signed_in? 
      @student = Student.new
    else
      redirect_to static_pages_home_path 
    end  
  end

  def show
    @student = Student.find(params[:id])	
  end

  def create
    nick = params[:student][:email].split("@")[0] 
    if !Student.all.collect(&:email).include? params[:student][:email]
      @student = Student.new(:nickname => nick, :email =>params[:student][:email], :password => params[:student][:password], :password_confirmation => params[:student][:password_confirmation])
      if @student.save
        StudentMailer.activation(@student).deliver
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def edit  
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @values = student_update_params

    respond_to do |format|
      format.js
    end
  end
  def student_reset_password
    if (params[:confirm_password]==params[:password] && params[:password].length>=6)
      @student=Student.find(params[:id])
      @student.password=params[:password]
      @student.password_confirmation=params[:confirm_password]
      @student.save
    end  
    respond_to do |format|
      format.js
    end
  end
  def forget_password
     @student = Student.new
  end
  private
    def student_params
      params.require(:student).permit(:email, :password,
                                   :password_confirmation)
    end

    def student_update_params
       params.require(:student).permit(:nickname, :email, :first, :gender,
                                   :password, :password_confirmation,
                                   :last, :age, :school, :grade, :island)
    end

   def signed_in_student
     puts signed_in?
     unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
   end

    def correct_student
      @student = Student.find(params[:id])
      redirect_to(root_url) unless current_student?(@student)
    end
end
