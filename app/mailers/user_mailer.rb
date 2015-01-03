class UserMailer < ApplicationMailer
  default from: "wjin@nyit.edu"

  def temp_mailer
    mail(:to => user.email, :subject => "Temp condition good")
  end

  def temp_error_mailer
    mail(:to => user.email, :subject => "Somethings wrong, there was no temp status in past 5 mins.")
  end
end

