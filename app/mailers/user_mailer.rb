class UserMailer < ApplicationMailer
  default :from => "wjin@nyit.edu"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered")
  end
end
