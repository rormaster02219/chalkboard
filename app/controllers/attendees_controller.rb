class AttendeesController < ApplicationController
 skip_before_action :verify_authenticity_token

  def create
    @subs = Attendee.new(attendee_params)
    @subs.save

  end

  def delete
  end

  def show
  end

  def index

  end 


  def other
    puts "inside here"
    x = Attendee.where(:student_id => current_student.id, :subject => params[:subject], :classroom_id =>params[:id])
    current = Classroom.find_by_id(params[:id])

    if x.length > 0
       puts "inside here"
       if x[0].status == "registered"
         current.size = current.size - 1
         current.save
         x[0].destroy

         @student = Student.find_by_id(current_student.id)
         StudentMailer.classrooms(@student,params[:subject],current.topic,"withdrawn",current.date_of.strftime("%B %d %Y %I:%M:%S") ).deliver

         wait = Attendee.where(:classroom_id => params[:id], :subject => params[:subject], :status => "waitlist")
         puts wait
         $i = 0
         if wait.length > 0
           chk = 0
	 else
           chk = -1
         end
         while chk == 0 do
           att = wait[$i]
           a = Subscription.where(:student_id => att.student.id, :subject => params[:subject],:activity => "online classroom").length
           c = Attendee.where(:subject => params[:id], :subject => params[:subject], :student_id => att.student.id, :status => "registered").length
           credit = a - c
           
           if credit > 0
             att.status = "registered"
             att.save
             current.size = current.size + 1
             current.waitlist = current.waitlist - 1
             current.save
             @student = Student.find_by_id(att.student.id)
             StudentMailer.classrooms(@student,params[:subject],current.topic,"registered",current.date_of.strftime("%B %d %Y %I:%M:%S")).deliver

             chk = 1
           end
           $i +=1
           if $i == wait.length
             chk = 1
           end
         end

       else
         current.waitlist = current.waitlist - 1
         current.save
         x[0].destroy
         @student = Student.find_by_id(current_student.id)
         StudentMailer.classrooms(@student,params[:subject],current.topic,"removed from the waitlist",current.date_of.strftime("%B %d %Y %I:%M:%S")).deliver
       end
    else
      if current.size < 4
        attendee = Attendee.new(:classroom_id => params[:id], :subject => params[:subject], :student_id => current_student.id, :status => "registered")
        puts attendee
        attendee.save
        current.size = current.size + 1
        current.save
        msg = "registered"
      else
        attendee = Attendee.new(:classroom_id => params[:id], :student_id => current_student.id, :subject => params[:subject], :status => "waitlist")
        attendee.save
        current.waitlist = current.waitlist + 1
        current.save
        msg = "waitlisted"
      end

      @student = Student.find_by_id(current_student.id)
      StudentMailer.classrooms(@student,params[:subject],current.topic,msg,current.date_of.strftime("%B %d %Y %I:%M:%S")).deliver

   end

  end

  private
    def attendee_params
      params.require(:attendee).permit(:status, :clasroom_id, :student_id)
    end

end
