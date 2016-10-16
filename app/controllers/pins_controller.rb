class PinsController < ApplicationController


  def show
    if params[:activity] == "online classroom"
      existence = Subscription.where(:student_id => params[:student],:subject => params[:subject])
      if existence.length == 0
        @msg = true
        @err = "must purchase 'online tutorial' for #{params[:subject]}"
      else
        pin = params[:pin]
        val = Pin.where(:number=>pin,:used=>false)[0].nil?
        @msg = val
        @err = "pin already in use"
        puts val
        if val == false
          little_pin = Pin.find_by(:number => pin)
          little_pin.update(:used => true)
        end
      end
   else
     pin = params[:pin]
     val = Pin.where(:number=>pin,:used=>false)[0].nil?
     @msg = val
     @err = "pin already in use"
     puts val
     if val == false
        little_pin = Pin.find_by(:number => pin)
        little_pin.update(:used => true)
     end  
   end
   
    x = Hash.new
    x["val"] = @msg
    x["msg"] = @err
    render json: x

  end


  def create

    @subs = Subscription.create(subscription_params)
    @subs.stripe_customer_token = params[:stripeToken]

    @student = Student.find_by_email(params[:subscription][:email])
    StudentMailer.payment(@student,params[:subscription][:subject]).deliver
  
  end

  private
    def subscription_params
      params.require(:subscription).permit(:student_id, :subject, :email,
                                   :activity, :stripe_card_token)
    end
end
