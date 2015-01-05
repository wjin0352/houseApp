class SessionsController < ApplicationController
  def new


  end

  def create
    user = User.where(username: params[:username]).first
     if user && user.authenticate(params[:password]) # pass in password to check if user authenticated
      # do login action
      # we wanna save that user info somewhere to say its tracked and is authenticated into a session hash!
      #
      # all that info in the hash will be backed by the browsers cookie, but there is
      # limited space so, we user to only save user.id into session not whole user
      # object, or you'll have cookie overflow error.  your cookie has size limitation


      # conceptually speaking when the user types in correct username and password, we are saving that user_id into
      # the session.  With this piece of information this is how we affect the rest of our application
      #  when we log out go to logout url, we remove that piece of information from session, SO how do we use this information for the
       # rest of our application??
       # the trick is in application controller we need to make some helper methods, current_user
      session[:user_id] = user_id

      # thats all you need to simulate login, flash notice
      flash[:notice] = "welcome, you made it!"
      redirect_to root_path
     else
      flash.now[:error] = "Opps, Somethings wrong with username or password."
      render :new # redirect_to login_path
     end
  end

  def destroy
    # destroys session by setting id to nil
    session[:user_id] = nil
    flash[:notice] = "You logged out"
    redirect_to root_path
  end

end
