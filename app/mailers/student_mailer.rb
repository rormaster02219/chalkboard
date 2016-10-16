class StudentMailer < ActionMailer::Base
  
  default :from => "tutor@242chalkboard.com"
  
  def activation(student)
    @student = student
    mail(:to => "#{student.nickname} <#{student.email}>", :subject => "Account Activation")
  end

  def contact_us(name,email,message)
  	@name =name
  	@email = email
  	@message =message
    mail(:from=>"#{@email}",:to => "tutor@242chalkboard.com", :subject => "Contact Us")

  end
  def reset_password(student)
    @student = student
    mail(:to => "#{student.nickname} <#{student.email}>", :subject => "Password change")
  end

  def payment(student,subject)
    @student = student
    @message = subject
    mail(:to => "#{student.nickname} <#{student.email}>", :subject => "Thank You for Payment")
  end

  def classrooms(student,subject,topic,status,date)
    @student = student
    @subject = subject
    @status = status
    @topic = topic
    @date = date
    mail(:to => "#{student.nickname} <#{student.email}>", :subject => "Registration")
  end

  def reminder(student,subject,topic,status,date)
    @student = student
    @subject = subject
    @status = status
    @topic = topic
    @date = date
    mail(:to => "#{student.nickname} <#{student.email}>", :subject => "Registration Reminder")
  end

  def class_scribblar(student,subject,topic,status,date,pass)
    @student = student
    @subject = subject
    @status = status
    @topic = topic
    @date = date
    @pass = pass
    mail(:to => "#{student.nickname} <#{student.email}>", :subject => "Classroom Link")
  end
end
