class HomeController < ApplicationController
  # start here by registering the user, or logging in
  def index
    # binding.pry
    if user_signed_in?
      # If you want to send emails right away (from a cronjob for example) just call deliver_now
      # info = current_user.email
      # UserMailer.welcome_email(current_user.email).deliver
      flash[:notice] = @user


      # after registered check redirected to users#index
      # redirect_to :controller =>'users', :action => 'index' shows the index list of etc
      # instead send to thermometer#index and show the thermometers for the user, no need to show users index...
      # think about where you want to send the user next, think about the story line!
      redirect_to user_thermometers_path(current_user)
    end
  end

end
