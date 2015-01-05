class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    # put as helper_method so they can be used outside applications controller, since we
    # need these 2 in the templates as well.  just add symbols to the helper_method
    # now these methods are available in all our controllers and view templates!
  helper_method :current_user, :logged_in?



  def current_user
    # saved as @current using ||= which is called memoization technique which is optimization technique
    # because current_user will be called many times in our app, i dont want this code to hit the
    # database everytime its called, so this is saying if this @current instance variable exists do
    # not run the code on the right, if it doesn't exist run right side code.  SO we guarantee this will
    # execute only once and the value is saved in @current_user, so if a template calls this multiple times
    # i only execute a hit to the database only one time!
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # just to read better
    #the !! bang bang turns that object into boolean value,
    !!current_user
  end
end
