require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron "0 23 * * *" do
   classr = Classroom.all
   classr.each_with_index {|val, index|
     if val.date_of.to_date - 3.days == Date.today
        i = val.id
        students = Attendee.where(:classroom_id => i,:status => "registered")
        students.each_with_index{|val2, index2|
          @student = Student.find_by_id(val2.student_id)
          StudentMailer.reminder(@student,val.subject,val.topic,val2.status,val.date_of.to_date).deliver
        }
     end

    if val.date_of.to_date - 1.days == Date.today
        i = val.id
        students = Attendee.where(:classroom_id => i,:status => "registered")
        students.each_with_index{|val2, index2|
          @student = Student.find_by_id(val2.student_id)
          StudentMailer.class_scribblar(@student,val.subject,val.topic,val2.status,val.date_of.to_date,val.classname).deliver
        }
     end
      }

end 
