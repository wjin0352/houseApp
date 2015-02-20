ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "google.com",
    :user_name            => "wjin@nyit.edu",
    :password             => "myson44",
    :authentication       => "plain",
    :enable_starttls_auto => true
}