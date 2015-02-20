class ReadingsController < ApplicationController

  def index
   @readings = Reading.all

  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
    @reading = Reading.new
  end

end
