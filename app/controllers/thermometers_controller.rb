class ThermometersController < ApplicationController

  def index
    @thermometers = current_user.thermometers.sort { |x,y| y <=>x }
    # binding.pry
    respond_to do |format|
      format.html { render :index }
      format.json { render :json }
    end
  end

  def show
    # 1st you retrieve the user thanks to params[:user_id]
    # user = User.find(params[:user_id])
    # 2nd you retrieve the thermometer thanks to params[:id]
    # @thermometer = user.thermometers.find(params[:id])
    @thermometer = current_user.thermometers.find(params[:id])
    #binding.pry
    respond_to do |format|

      format.json { render json: @thermometer }
    end
  end

  def new
    # 1st you retrieve the user thanks to params[:user_id]
    # @user = User.find(params[:user_id])
    @user = current_user # devise gives us this method to use, makes it easier to reference logged in user
    # i didn't use just current_user because i need @user instance var in the new form
    # 2nd you build a new one
   @thermometer = @user.thermometers.build

  end


  def create
    # user = User.find(params[:user_id])
    # @thermometer = user.thermometers.create(thermometer_params)
    @thermometer = current_user.thermometers.new(thermometer_params)
    @thermometer.get_readings
    @thermometer.evaluate
    respond_to do |format|
      if @thermometer.save
        format.html { redirect_to user_thermometers_path, :notice => "#{@thermometer.location} thermometer was successfully created."}
        format.json { render :json }
      else
        flash[:notice] = @thermometer.errors.full_messages
        format.html { redirect_to new_user_thermometer_path}
        format.json { render :json => @thermometer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    # 1st you retrieve the user thanks to params[:user_id]
     @user = User.find(params[:user_id])
    # 2nd you retrieve the thermometer thanks to params[:id]
     # I used @user instead of current_user because i need use of @user in the form for edit
    @thermometer = @user.thermometers.find(params[:id])

  end

  def update
    @user = User.find(params[:user_id])
    # must use thermometer_params because update action is similar to create action and must use strong parameters.
    @thermometer = @user.thermometers.find(params[:id])

    respond_to do |format|
      if @thermometer.update_attributes(thermometer_params)
        format.html { redirect_to user_thermometers_path, notice: "successfully updated #{@thermometer.location} thermometer" }
        format.json {}
        format.js {}
      else
        flash[:notice] = @thermometer.errors.full_messages
        format.html { render :edit }
        format.json {}
      end
    end
  end

  def destroy
    # user = User.find(params[:user_id])
    user = current_user
    @thermometer = user.thermometers.find(params[:id])
    @thermometer.destroy
    respond_to do |format|
      flash[:notice] = "#{@thermometer.location} thermometer was destroyed"
      format.html { redirect_to user_thermometers_path }
      format.js {}
    end
  end

  private

  def thermometer_params
    params.require(:thermometer).permit(:location, :name, :temperature, :maxTemp, :minTemp, :readingsOn)
  end

end
