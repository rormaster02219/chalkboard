class TrackingsController < ApplicationController

  def create
    track = Tracking.where(:subject => params[:tracking][:subject], :module_test => params[:tracking][:module_test],
                           :module_test_name => params[:tracking][:module_test_name],
                           :student_id => params[:tracking][:student_id]).first
    if track.nil?
      Tracking.create(tracking_params)
    else
      track.update(:question => params[:tracking][:question])
    end
  end

  respond_to do |format|
    format.js
  end

  private
    def tracking_params
      params.require(:tracking).permit(:question,:module_test, :module_test_name,
                                   :subject, :student_id)
    end
end
