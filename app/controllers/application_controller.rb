class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # authenticate_user! as an action that has to be performed before serving any page.
  before_action :authenticate_user!


end
