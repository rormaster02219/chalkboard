module SubjectsHelper

  def show_all(subject,module_test)

    statistics = Hash.new
    total_module = Question.where(:subject => subject, :module_test => module_test).count
    complete_module = Result.where(:subject => subject, :module_test => module_test).collect(&:student_answer).compact.count

    @complete_percent_module = ((complete_module.to_f/total_module.to_f) * 100).round(1)
    if @complete_percent_module.nan?
      @complete_percent_module=0.0
    end  
    list = Question.where(:subject => subject,:module_test => module_test).order("module_test_name").pluck("DISTINCT module_test_name")

    total_by_result_module = Result.where(:subject => subject, :module_test => module_test).count

    complete_true_module = Result.where(:subject => subject, :module_test => module_test, 
                                        :correct => true, :student_id => current_student.id).count

    @complete_true_percent_module = ((complete_true_module.to_f/total_by_result_module.to_f) * 100).round(1)
    if @complete_true_percent_module.nan?
      @complete_true_percent_module=0.0
    end  
    
    list.each do |i|
      stats = Hash.new
      total = Question.where(:subject => subject, :module_test => module_test, :module_test_name => i).count
      answered=  Result.where(:subject => subject, :module_test => module_test, :module_test_name => i, :student_id => current_student.id).collect(&:student_answer).compact.count
      
      stats["answered"] = answered
      stats["unanswered"] = total - answered
  
      correct = Result.where(:subject => subject, :module_test => module_test, :module_test_name => i, :correct => true, :student_id => current_student.id).count
      stats["correct"] = correct
      stats["incorrect"] = total - correct
     

      statistics[i] = stats

    end

    if params[:sort_by] == "Completed"
      puts "YES" 
      stat_arr = statistics.to_a

      (0..(statistics.count-1)).each do |input|
        
        if !stat_arr[input+1].nil?
          
          if ((100/(stat_arr[input+1].second["unanswered"]+stat_arr[input+1].second["answered"]))*stat_arr[input+1].second["answered"]).to_f.round(2)> ((100/(stat_arr[input].second["unanswered"]+stat_arr[input].second["answered"]))*stat_arr[input].second["answered"]).to_f.round(2)
            a = stat_arr[input]
            stat_arr[input] = stat_arr[input+1]
            stat_arr[input+1] = a
          end
        end
      end
      
      temp = Hash.new
      stat_arr.each do |key, value|
    	item = key
	puts key
      	total = Question.where(:subject => subject, :module_test => module_test, :module_test_name => item).count 
     	puts total
	value.each do |k,v| 
		if k.eql? "answered"
			puts v
			if v.to_i > 0
				temp[key] = (v.to_f/total.to_f).round(2)
			else
				temp[key] = 0
			end
		end
        end
      end 

      stat = Hash[*stat_arr.flatten]
      stat2 = Hash.new
      tmp_new = Hash.new
      tmp_new = temp.sort_by {|_key, value| value}.reverse
      tmp_new.each do |k,v|
	stat2[k] = stat[k] 

      end

      statistics = stat2
    end

    if params[:sort_by] == "result"
      stat_arr = statistics.to_a

      (0..(statistics.count-1)).each do |input|

        if !stat_arr[input+1].nil?

          if ((100/(stat_arr[input+1].second["unanswered"]+stat_arr[input+1].second["answered"]))*stat_arr[input+1].second["correct"]).to_f.round(2)> ((100/(stat_arr[input].second["unanswered"]+stat_arr[input].second["answered"]))*stat_arr[input].second["correct"]).to_f.round(2)
            a = stat_arr[input]
            stat_arr[input] = stat_arr[input+1]
            stat_arr[input+1] = a
          end
        end


      temp = Hash.new
      stat_arr.each do |key, value|
        item = key
        puts key
        total = Question.where(:subject => subject, :module_test => module_test, :module_test_name => item).count
        puts total
        value.each do |k,v|
                if k.eql? "correct"
                        puts v
                        if v.to_i > 0
                                temp[key] = (v.to_f/total.to_f).round(2)
                        else
                                temp[key] = 0
                        end
                end
        end
      end

      stat = Hash[*stat_arr.flatten]
      stat2 = Hash.new
      tmp_new = Hash.new
      tmp_new = temp.sort_by {|_key, value| value}.reverse
      tmp_new.each do |k,v|
        stat2[k] = stat[k]

      end

      statistics = stat2

      end

    end

    return statistics
  end

  def pie_chart(subject,module_test)
    
    total_module = Question.where(:subject => subject, :module_test => module_test).count
    complete_module = Result.where(:subject => subject, :module_test => module_test,:student_id=>current_student.id).collect(&:student_answer).compact.count
    incomplete_module = total_module - complete_module
    
    complete_percent_module = ((complete_module.to_f/total_module.to_f) * 100).round(1)
    incomplete_percent_module = ((incomplete_module.to_f/total_module.to_f) * 100).round(1)

    total_by_result_module = Result.where(:subject => subject, :module_test => module_test, :student_id => current_student.id).collect(&:student_answer).compact.count
    complete_true_module = Result.where(:subject => subject, :module_test => module_test, 
                                      :correct => true, :student_id => current_student.id).count
    complete_false_module = Result.where(:subject => subject, :module_test => module_test, 
                                         :correct => false, :student_id => current_student.id).count

    complete_true_percent_module = ((complete_true_module.to_f/total_module.to_f) * 100).round(1)
    if complete_true_percent_module.nan?
      complete_true_percent_module=0.0
    end  
    complete_false_percent_module = ((complete_false_module.to_f/total_module.to_f) * 100).round(1)
    
    stats = {}
    stats["complete_module"] = complete_module
    stats["incomplete_module"] = incomplete_module
    stats["complete_percent_module"] = complete_percent_module
    stats["complete_true_module"] = complete_true_module
    stats["complete_false_module"] = total_module - complete_true_module
    stats["complete_true_percent_module"] = complete_true_percent_module
    stats["complete_false_percent_module"] = complete_false_percent_module

   return stats

  end

  def top_five(subject,module_test)
    record = Hash.new

    list = Result.where(:subject => subject, :module_test => module_test).pluck("DISTINCT module_test_name")
 
    list.each do |i|
      right = Result.where(:subject => subject, :module_test => module_test, :correct => true, :student_id => current_student.id).count
      wrong = Result.where(:subject => subject, :module_test => module_test, :correct => false, :student_id => current_student.id).count
      record[i] = right - wrong
    end

    record.sort {|a1,a2| a2[1].to_i <=> a1[1].to_i }

    top_five = {}   
    count = 0
    record.each do |i,j|
      stats = Hash.new
      break if count == 4

      c = Result.where(:subject => subject, :module_test => module_test, 
                                      :module_test_name => i, :correct => true, :student_id => current_student.id).count
      stats["correct"] = c
      inc = Question.where(:subject => subject, :module_test => module_test, 
                                        :module_test_name => i).count

      stats["incorrect"] = inc - c	
      top_five[i] = stats
      count +=1

    end

    puts top_five
    return top_five
  end


end
