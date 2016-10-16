module ReportsHelper

  def pie_chart(subject, module_test)
   
    stats = Hash.new

    total = Question.where(:subject => subject, :module_test => module_test).count
    complete_right = Result.where(:subject => subject, :module_test => module_test,
                                        :correct => true, :student_id => current_student.id).count
    complete_wrong = total - complete_right
    @student_subject_subscription=Subscription.find_all_by_student_id(current_student.id).collect(&:subject) if !Subscription.find_all_by_student_id(current_student.id).blank?
    @subscription_subject=[]
    if !@student_subject_subscription.blank?
      @student_subject_subscription.each do |student_subject_subscription|
        @result_subject=Result.where(:student_id=>current_student.id,:subject =>student_subject_subscription)
        
        @subscription_subject=@result_subject+@subscription_subject
      end  
      @total_subscription_subject=@subscription_subject.count
      @total_correct_subscription=@subscription_subject.select{|p| p.correct=='t'}.count
      @total_correct_subscription_percent=((@total_correct_subscription.to_f/@total_subscription_subject)*100).round(1)
    else
       @total_subscription_subject=0.0
        @total_correct_subscription=0.0
        @total_correct_subscription_percent=0.0

    end
    complete_module = Result.where(:subject => subject, :module_test => module_test,:student_id => current_student.id).collect(&:student_answer).compact.count
    stats["incomplete_module"] =incomplete_module=total-complete_module
    stats["complete_module_percent"] = ((complete_module.to_f/total.to_f) * 100).round(1)
    stats["incomplete_module_percent"] = ((incomplete_module.to_f/total.to_f) * 100).round(1)
    stats["complete_module"] = complete_module
    stats["complete_right"] = complete_right
    stats["complete_wrong"] = complete_wrong   

    stats["complete_right_percent"] = ((complete_right.to_f/total.to_f) * 100).round(1)
    stats["complete_wrong_percent"] = ((complete_wrong.to_f/total.to_f) * 100).round(1)
    
    # accuracy

      stats["complete_true_module"]=complete_true_module = Result.where(:subject => subject, :module_test => module_test, 
                                        :correct => true, :student_id => current_student.id).count
      stats["complete_false_module"] = total - complete_true_module
complete_false_module = total - complete_true_module
#complete_false_module = Result.where(:subject => subject, :module_test => module_test, :correct => false, :student_id => current_student.id).count
      stats["complete_true_percent_module"] =complete_true_percent_module = ((complete_true_module.to_f/total.to_f) * 100).round(1)
      if complete_true_percent_module.nan?
        complete_true_percent_module=0.0
      end  
       stats["complete_false_percent_module"] =complete_false_percent_module = ((complete_false_module.to_f/total.to_f) * 100).round(1)

    return stats
  end

  def pie_chart_all(module_test_calc)
    
    total_answered =  module_test_calc["answered"]+module_test_calc["unanswered"]
    total_result =  module_test_calc["correct"]+module_test_calc["incorrect"]
    module_test_calc["total_answered_percentage"] = ((module_test_calc["answered"].to_f/total_answered.to_f) * 100).round(1)
    module_test_calc["total_result_percentage"] = ((module_test_calc["correct"].to_f/total_result.to_f) * 100).round(1)
    if module_test_calc["total_answered_percentage"].nan?
        module_test_calc["total_answered_percentage"] = 0 
    end
    if module_test_calc["total_result_percentage"].nan?
        module_test_calc["total_result_percentage"] = 0 
    end
    return module_test_calc
  end 
  
  def pie_chart_round(module_value)
    if module_value.nan?
        module_value = 0 
    end
    return module_value.to_f
  end 
      
  def pie_chart_degree(module_degree)
    if module_degree.nan?
        module_degree = 0 
    end
    degrees = (module_degree*3.6).to_i
    degrees = degrees
    return degrees
  end

  def chart_180(chart_draw_180)
    if chart_draw_180>180
    chart_class_180 = "out180"
    end
    return chart_class_180
  end
  def red_chart_180(chart_draw_180)
    if chart_draw_180>180
    chart_class_180 = "redOut180"

    else
      chart_class_180 = "redOutLess"
    end 
    return chart_class_180
  end
   def test_red_chart_180(chart_draw_180)
    
    if chart_draw_180>180
    chart_class_180 = "redOut180"
    end  
    return chart_class_180
  end

end
