class UsersController < ApplicationController
    # devise is pretty much doing all this for us, i commented out and i can still create new user in registration

    before_action :set_user, only: [:show, :edit, :update, :destroy ]

    # being done in applicationController so it's for all controllers
    before_filter :authenticate_user!

  # ***
  # CREATE SEQUENCE user_id_seq;
  # ALTER TABLE user ALTER user_id SET DEFAULT NEXTVAL('user_id_seq');
  # ***

  def index
  # binding.pry
  # coming from home#index
  # Solution to N + 1 queries problem
    @users = User.includes(:thermometers,:readings).all
    # rails will render views/users/v
  end

  def show
     # binding.pry
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    # binding.pry
    @user = User.new(user_params) # using user_params because strong parameters
                                  # is require by rails when creating, as security measure.

    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver

        # Tell the UserMailer to send a welcome email after save
        # Active Job's default behavior is to execute jobs ':inline'. So, you can use
        # deliver_later now to send emails, and when you later decide to start sending
        # them from a background job, you'll only need to set up Active Job to use a queueing
        # backend (Sidekiq, Resque, etc).


        format.html { redirect to @user, notice: 'User was successfully created!' }
        format.json { render :show, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params) # might be an error, instead try giving params[:id]...
        format.html { redirect_to @user, notice: 'User was successfully updated!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

    def login
      @user = User.koala(request.env['omniauth.auth']['credentials'])
    end


  private
  # watch how you use set_user if the :id isn't required, you will run into issues.  Make sure the url
  # references :id if you want to use set_user
    # set_user is unnecessary in this case just use devise current_user method to grab the user that's logged in
  def set_user
    @user = User.find(params[:user_id])
  end

  # strong parameters rails convention for this
  def user_params
    params.require(:user).permit(:name, :email)
  end




end

