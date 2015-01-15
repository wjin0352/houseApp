class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :create, :update, :destroy ]
    before_filter :authenticate_user!
  # ***
  # CREATE SEQUENCE user_id_seq;
  # ALTER TABLE user ALTER user_id SET DEFAULT NEXTVAL('user_id_seq');
  # ***

  def index
     # binding.pry
     # coming from home#index
    @users = User.all
     # rails will render views/users/index by default
  end

  def show
     # binding.pry
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    # binding.pry
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
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
      if @user.update(user_params)
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


  private
  # watch how you use set_user if the :id isn't required, you will run into issues.  Make sure the url
  # references :id if you want to use set_user
  def set_user
    @user = User.find(params[:user_id])
  end
  # strong parameters rails convention for this
  def user_params
    params.require(:user).permit(:name, :email)
  end




end

