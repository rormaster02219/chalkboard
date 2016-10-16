class ExamsController < ApplicationController

  def show
  if signed_in?
    @chk = "yes"
  	s = params[:id]
        registered_date = Subscription.where(:student_id => current_student.id, :subject => s).pluck("created_at").sort.last
      if registered_date.nil?
        @chk = "sub"
      else
        delta = DateTime.now.mjd - registered_date.to_datetime.mjd
        if delta > 365
          @chk = "sub"
        end
      end
  else
    @chk = "no"
  end

  end

end
