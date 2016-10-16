module QuestionsHelper
	def pie_chart(subject,module_test_name)
    
    total_module = Question.where(:subject => subject, :module_test_name => module_test_name).count
    complete_module = Result.where(:subject => subject, :module_test_name => module_test_name,:student_id=>current_student.id).collect(&:student_answer).compact.count
    incomplete_module = total_module - complete_module
    
    complete_percent_module = ((complete_module.to_f/total_module.to_f) * 100).round(1)
    incomplete_percent_module = ((incomplete_module.to_f/total_module.to_f) * 100).round(1)

    total_by_result_module = Result.where(:subject => subject, :module_test_name => module_test_name, :student_id => current_student.id).collect(&:student_answer).compact.count
    complete_true_module = Result.where(:subject => subject, :module_test_name => module_test_name, 
                                      :correct => 't', :student_id => current_student.id).count
    # complete_true_module = Result.where(:subject => subject, :module_test_name => module_test_name, 
    #                                    :correct => 1, :student_id => current_student.id).count
    complete_false_module = Result.where(:subject => subject, :module_test_name => module_test_name, 
                                         :correct => 'f', :student_id => current_student.id).count
     # complete_false_module = Result.where(:subject => subject, :module_test_name => module_test_name, 
     #                                      :correct => 0, :student_id => current_student.id).count

    complete_true_percent_module = ((complete_true_module.to_f/total_by_result_module.to_f) * 100).round(1)
    if complete_true_percent_module.nan?
      complete_true_percent_module=0.0
    end  
    complete_false_percent_module = ((complete_false_module.to_f/total_by_result_module.to_f) * 100).round(1)
    
    stats = {}
    stats["complete_module"] = complete_module
    stats["incomplete_module"] = incomplete_module
    stats["complete_percent_module"] = complete_percent_module
    stats["complete_true_module"] = complete_true_module
    stats["complete_false_module"] = complete_false_module
    stats["complete_true_percent_module"] = complete_true_percent_module
    stats["complete_false_percent_module"] = complete_false_percent_module

   return stats

  end
end
