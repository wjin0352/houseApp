class HomeController < ApplicationController
  # start here by registration
  def index
    if user_signed_in?
      # after registered check redirected to users#index
      # redirect_to :controller =>'users', :action => 'index'
      # instead send to thermometer#index and show the thermometers for the user, no need to show users index
      redirect_to user_thermometers_path(current_user)
    end
  end

end
