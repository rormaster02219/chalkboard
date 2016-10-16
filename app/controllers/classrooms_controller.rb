class ClassroomsController < ApplicationController

  def create

    @subs = Classroom.new(classroom_params)

  end

  def show
    a = Subscription.where(:student_id => current_student.id, :subject => params[:id],:activity => "online classroom").length
    b = Classroom.joins(:attendees).where(:subject => params[:id]).length
    c = Attendee.where(:subject => params[:id], :student_id => current_student.id, :status => "registered").length     
    @credit = a - c
    @class = Classroom.where(:subject => params[:id],:status => "active").order(:date_of).limit(5)
    @reg = Attendee.where(:student_id=>current_student.id).pluck(:classroom_id)
    @st = Attendee.where(:student_id=>current_student.id)
 
  end


  def index

  end

  private
    def classroom_params
      params.require(:classroom).permit(:topic, :size, :waitlist,
                                   :date_of)
    end

end
