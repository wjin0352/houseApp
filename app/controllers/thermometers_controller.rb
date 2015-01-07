class ThermometersController < ApplicationController
  before_action  :require_user, except: [:show, :index]

  # ***
  # CREATE SEQUENCE user_id_seq;
  # ALTER TABLE user ALTER user_id SET DEFAULT NEXTVAL('user_id_seq');
  # ***

  def index
    # 1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    # 2nd you get all the thermometers of this user
    @thermometers = user.thermometers

    respond_to do |format|
      format.html {  }
      format.json { render :json }
    end
  end

  def show
    # 1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    # 2nd you retrieve the thermometer thanks to params[:id]
    @thermometer = user.thermometers.find(params[:id])

    respond_to do |format|
      format.html { }
      format.json { render :json }
    end
  end

  def new
    # 1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    # 2nd you build a new one
    @thermometer = user.thermometers.build

    respond_to do |format|
      format.html {}
      format.json {render :json}
    end
  end

  def edit
    # 1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    # 2nd you retrieve the thermometer thanks to params[:id]
    @thermometer = user.thermometers.find(params[:id])
  end

  def create
    user = User.find(parmas[:user_id])
    @thermometer = user.thermometers.create(params[:id])

    respond_to do |format|
      if @thermometer.save
        format.html { redirect_to [@thermometer.user, @user], :notice => 'Comment was successfully created.'}
        format.json { render :json }
      else
        format.html { render :action => "new"}
        format.json { render :json => @thermometer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    user = User.find(params[:user_id])
    @thermometer = user.thermometers.find(params[:id])

    respond_to do |format|
      if @thermometer.update_attributes(params[:comment]).permit(:comment, :body)
        format.html {}
        format.json {}
      else
        format.html {}
        format.json {}
      end
    end
  end

  def destroy

  end







end
