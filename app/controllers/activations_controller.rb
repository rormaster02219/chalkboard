class ActivationsController < ApplicationController

  def update
    @student = Student.find_by_activation_token(params[:id])

    @student.update_attribute(:active, true)
    sign_in_user @student
    redirect_to @student
  end
 
end
