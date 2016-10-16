class StaticPagesController < ApplicationController
  def home
  	
    @student = Student.new
  end

  def help
  end
  
  def contact
    
  	@message = params[:message]
  	@email =params[:email]
  	@name =params[:name]

    if !@email.blank? && !@message.blank? && !@name.blank?

      StudentMailer.contact_us(@name,@email,@message).deliver
    end 
    respond_to do |format|
      format.js
     end

     
   end

end
