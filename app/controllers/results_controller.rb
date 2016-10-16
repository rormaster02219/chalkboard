class ResultsController < ApplicationController

  def create
    
    student = Result.where(:number => params[:result][:number], :subject => params[:result][:subject],
                           :module_test => params[:result][:module_test], :module_test_name => params[:result][:module_test_name],
                           :student_id => params[:result][:student_id]).first
    if student.nil?
      Result.create(result_params)
    else
      student.update(:correct => params[:result][:correct], :student_answer => params[:result][:student_answer])
    end

    todays_date = Date.today
    student_data = Mode.where(:student_id => params[:result][:student_id]).first
    if student_data.nil?
      Mode.create(:student_id => params[:result][:student_id], :latest_activity => todays_date, :points => 10)
    else
      recent = student_data.latest_activity
      last_date = recent.to_date
      if (todays_date - last_date).to_i > 0
        points = student_data.points + 10
        student_data.update(:latest_activity => todays_date, :points => points)
      end
    end
  end

  def index
    total = Question.where(:subject => params[:result][:subject], :module_test_name => params[:result][:module_test_name], 
                           :module_test => params[:result][:module_test]).count
    correct = Result.where(:subject => params[:result][:subject], :module_test_name => params[:result][:module_test_name], 
                           :module_test => params[:result][:module_test], :student_id => params[:result][:student_id], :correct => "t").count
    @test_results = (correct.to_f / total.to_f ) * 100
  end

  respond_to do |format|
    format.html { redirect_to @result.question_id }
    format.js
  end

  private
    def result_params
      params.require(:result).permit(:question_id, :student_id, :correct, :number,
                                   :subject, :module_test, :module_test_name, :student_answer)
    end

end
