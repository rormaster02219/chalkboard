ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options = { :host => "http://242chalkboard.com/" }
ActionMailer::Base.smtp_settings = {
     :address => "smtp.gmail.com",
     :port => 587,
     :domain => 'chalkboard242.com',
     :user_name => "tutor@242chalkboard.com",
     :password => "bgc53bahama5",
     :authentication => :plain,
     :enable_starttls_auto => true
}
