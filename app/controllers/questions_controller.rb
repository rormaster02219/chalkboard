class QuestionsController < ApplicationController
  include QuestionsHelper
  def show
    
    @question = Question.where(:subject => params[:subject], :module_test => params[:module_test],  :module_test_name => params[:module_test_name],:number => params[:number]).first
    @total_question = Question.where(:subject => params[:subject], :module_test_name => params[:module_test_name]).count
    t = Result.where(:subject => params[:subject],:module_test => params[:module_test], :student_id => current_student.id, :module_test_name => params[:module_test_name],:number => params[:number])
    @result_set = t.empty? ? "yes" : t[0].student_answer

   x = Integer(params[:number])
    
    @fwd = x + 1
    @back = x - 1
   
    @result = Result.new
    @tracking = Tracking.new

    @which = params[:module_test]

    @total = Question.where(:subject => params[:subject], :module_test => params[:module_test],   :module_test_name => params[:module_test_name]).count 

    if params[:module_test].eql? "module"
      track = Tracking.where(:subject => params[:subject], :module_test =>params[:module_test],:module_test_name => params[:module_test_name],:student_id => current_student.id).first
      if track.nil?
        Tracking.create(:question => params[:number],:subject => params[:subject], 
                           :module_test =>params[:module_test],:module_test_name => params[:module_test_name],
                           :student_id => current_student.id)
      else
        track.update(:question => params[:number])
      end
    end
    if  !@question.blank?
      @result = @question.results.where(:student_id=> current_student.id )

      @completed = Result.where(:student_id=> current_student.id,:module_test_name=>params[:module_test_name] ).collect(&:student_answer).compact.count
      
      @total_completed_percentage = (( @completed.to_f/@total_question.to_f) * 100).round(1)
      @total_correct=Result.where(:student_id=> current_student.id,:module_test_name=>params[:module_test_name] ).where(:correct=>"1").count
      @total_correct_percentage = (( @total_correct.to_f/@total_question.to_f) * 100).round(1)
      @total_incorrect=@total_question-@total_correct
    end
    @timer = Question.where(subject: @question.subject, module_test_name: @question.module_test_name).collect(&:timer)[0]  

    if @total_correct_percentage.nil? || @total_correct_percentage.nan? 
      @total_correct_percentage=0
    end
    @total_test_question=@total_question - @completed
    
    @module_stats = pie_chart(params[:subject], params[:module_test_name])

  end

  def student_answer_create
    @total = Question.where(:subject => params[:subject], :module_test => params[:module_test],   :module_test_name => params[:module_test_name]).count 
    @question = Question.find(params[:question_id])
    @total_question = Question.where(subject: @question.subject, module_test: @question.module_test, module_test_name: @question.module_test_name).count
    
    if !params[:answer].blank?
      if (params[:answer]==@question[@question.answer])
        @correct='t'
      else
        @correct='f'
      end
    else  
      if !Result.find_by_question_id_and_student_id(params[:question_id],current_student.id).blank?
        @correct=Result.find_by_question_id_and_student_id(params[:question_id],current_student.id).correct
        params[:answer]=Result.find_by_question_id_and_student_id(params[:question_id],current_student.id).student_answer
      else
        @correct='f'
        params[:answer]=" "
      end  
      
    end  

    if !Result.find_by_question_id_and_student_id(params[:question_id],current_student.id).blank?
      @result_que=Result.find_by_question_id_and_student_id(params[:question_id],current_student.id)
      @result_que.update(:student_id=> current_student.id,module_test_name: @question.module_test_name,correct:@correct,student_answer:params[:answer])
      @result_que.save
            
    elsif params[:answer]!=" "  
      Result.create(question_id:params[:question_id],student_id:current_student.id,correct:@correct,student_answer:params[:answer],module_test:params[:module_test],subject:params[:subject],number:params[:number],module_test_name: @question.module_test_name)   
     
    end 
    @completed =Result.where(:student_id=> current_student.id,module_test_name: @question.module_test_name ).collect(&:student_answer).compact.count    
    @total_test_question=@total_question-@completed
    correct_answer =@question.send(@question.answer)
    @total_correct=Result.where(:student_id=> current_student.id,:module_test_name=>@question.module_test_name ).where(:correct=>"1").count
    @total_incorrect=@total_question-@total_correct
    
    @total_correct_percentage = (( @total_correct.to_f/@total_question.to_f) * 100).round(1)
    @total_completed_percentage = (( @completed.to_f/@total_question.to_f) * 100).round(1)
    student_answer = params[:answer]
    if (student_answer == correct_answer)
      @correct =true
    else
      @correct =false
    end
    @timer=Question.find_all_by_module_test_name(@question.module_test_name).collect(&:timer)[0]

    @quest_result = @question.results.where(:student_id=> current_student.id )

    if @quest_result.blank? && params[:answer]!=" "
      result =  Result.create(:question_id=>@question.id,:student_id=> current_student.id,:correct=>@correct,:student_answer=>student_answer,:module_test=> @question.module_test,:subject=>@question.subject.downcase ,:number=> @question.number,:module_test_name  =>@question.module_test_name )
    elsif params[:answer]!=" "
      result =  @quest_result.first.update_attributes(:question_id=>@question.id,:student_id=> current_student.id,:correct=>@correct,:student_answer=>student_answer,:module_test=> @question.module_test,:subject=>@question.subject.downcase ,:number=> @question.number,:module_test_name  => @question.module_test_name )
    end
    
    x = Integer(params[:number])
    
    @fwd = x + 1
    @back = x - 1

    
    @which = params[:module_test]

    if params[:type] == "slide_next"
      @question = Question.find_by_module_test_name_and_number_and_subject(@question.module_test_name, @fwd, @question.subject)
    elsif params[:type] == "slide_prev" 
      @question = Question.find_by_module_test_name_and_number_and_subject(@question.module_test_name, @back, @question.subject)
    end
    
    if(!@question.nil? && !@question.results.blank?)
      @result = @question.results.where(:student_id=> current_student.id ) 
    end  
    
     @module_stats = pie_chart( @question.subject, @question.module_test_name)
  end
 

end
