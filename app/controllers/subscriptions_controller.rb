class SubscriptionsController < ApplicationController

  def new

    @pin = Pin.new    
    @subscription = Subscription.new
    @subject_list = []
    subjects = ["mathematics","chemistry","physics","biology","language"]
    for s in subjects
      registered_date = Subscription.where(:student_id => current_student.id, :subject => s).pluck("created_at").sort.last
      if registered_date.nil?
        @subject_list.push(s)
      else
        delta = DateTime.now.mjd - registered_date.to_datetime.mjd
        if delta > 365
          @subject_list.push(s)
        end
      end 
    end
  end 

  def create


    @subs = Subscription.create(subscription_params)
    @subs.stripe_customer_token = params[:stripeToken]

    @student = Student.find_by_email(params[:subscription][:email])
    StudentMailer.payment(@student,params[:subscription][:subject]).deliver

  end

  def show
    @subscription = Subscription.where(:student_id => params[:id])
    render json: @subscription 
  end


  private
    def subscription_params
      params.require(:subscription).permit(:student_id, :subject, :email,
                                   :activity, :stripe_card_token)
    end
end
