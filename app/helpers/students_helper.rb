module StudentsHelper

	def profile
		if Student.where(:id => 66).pluck(:first)[0].nil?
			msg = "Please complete your profile!"
                elsif Student.where(:id => 66).pluck(:last)[0].nil?
                        msg = "Please complete your profile!"
                elsif Student.where(:id => 66).pluck(:age)[0].nil?
                        msg = "Please complete your profile!"
                elsif Student.where(:id => 66).pluck(:school)[0].nil?
                        msg = "Please complete your profile!"
                elsif Student.where(:id => 66).pluck(:grade)[0].nil?
                        msg = "Please complete your profile!"
                elsif Student.where(:id => 66).pluck(:island)[0].nil?
                        msg = "Please complete your profile!"
                elsif Student.where(:id => 66).pluck(:gender)[0].nil?
                        msg = "Please complete your profile!"
		else
			msg = ""
		end
	end

end
