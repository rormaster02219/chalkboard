class ReportsController < ApplicationController
  before_action :sign_in_user

  include ReportsHelper

  def index
    subject = ["mathematics", "chemistry", "physics", "biology"]

    @module = Hash.new
    for i in subject
        @module[i] = pie_chart(i,"module")
    end

    @test = Hash.new
    for i in subject
      @test[i] = pie_chart(i,"test")
    end    

    @dates = Hash.new
    for i in subject
      if !ExamDates.where(:subject=>i).pluck("exam").blank?
        @dates[i] = (ExamDates.where(:subject=>i).pluck("exam").first.to_date - Date.today.to_date).to_i
      end  
    end   

    @points = Mode.where(:student_id => current_student.id).pluck("points").first

  end

  
  def module_index
    subject = ["mathematics", "chemistry", "physics", "biology"]

    @module = Hash.new
    for i in subject
        @module[i] = pie_chart(i,"module")
    end

    @test = Hash.new
    for i in subject
      @test[i] = pie_chart(i,"test")
    end    

    @dates = Hash.new
    for i in subject
      if !ExamDates.where(:subject=>i).pluck("exam").blank?
        @dates[i] = (ExamDates.where(:subject=>i).pluck("exam").first.to_date - Date.today.to_date).to_i
      end  
    end   

    @points = Mode.where(:student_id => current_student.id).pluck("points").first

  end

   def test_index
    subject = ["mathematics", "chemistry", "physics", "biology"]

    @module = Hash.new
    for i in subject
        @module[i] = pie_chart(i,"module")
    end

    @test = Hash.new
    for i in subject
      @test[i] = pie_chart(i,"test")
    end    

    @dates = Hash.new
    for i in subject
      if !ExamDates.where(:subject=>i).pluck("exam").blank?
        @dates[i] = (ExamDates.where(:subject=>i).pluck("exam").first.to_date - Date.today.to_date).to_i
      end  
    end   

    @points = Mode.where(:student_id => current_student.id).pluck("points").first

  end

  def sign_in_user
    if !signed_in?
      redirect_to signin_path
    end
  end
end
