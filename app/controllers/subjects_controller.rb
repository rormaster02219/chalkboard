class SubjectsController < ApplicationController
  before_action :sign_in_user

  include SubjectsHelper

  def show
    if params[:sort_by].nil?
      track = Tracking.where(:student_id => current_student.id, :subject => params[:subject], :module_test => params[:module_test], :module_test_name => params[:module_test_name]).first
    else
      track = Tracking.where(:student_id => current_student.id, :subject => params[:subject], :module_test => params[:module_test]).first
    end

    if track.nil?
      @i = 1
    else
      @i = track.question
    end

    @which = params[:module_test]

    
    @statistics = show_all(params[:subject],params[:module_test])
  
    @locked = "no"
    registered_date = Subscription.where(:student_id => current_student.id, :subject => params[:subject]).pluck("created_at").sort.last
   
      if registered_date.nil?
        @locked = "yes"
      else
        if (registered_date.to_datetime + 365.days) < DateTime.now
          @locked = "yes"
        end
      end

    if !params[:sort_by].nil?
      respond_to do |format|
        format.js
      end
    end 

  end


  def index

    @module_stats = pie_chart(params[:subject],"module")
    @test_stats = pie_chart(params[:subject],"test")

    @module_top_five = top_five(params[:subject],"module")
    @test_top_five = top_five(params[:subject],"test")

  end

 def sign_in_user
    if !signed_in?
      redirect_to signin_path
    end
  end


end
