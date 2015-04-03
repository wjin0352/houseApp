class Thermometer < ActiveRecord::Base
  require 'httparty'
  require 'json'
    # belongs_to associations must use singular term, plural would cause error
    # This is because Rails automatically infers the class name from the association name.
    # If the association name is wrongly pluralized, then the inferred class will be wrongly
    # pluralized too.
  belongs_to :user
  has_many :readings, dependent: :destroy

  validates_presence_of :maxTemp
  validates_presence_of :minTemp
  validates_presence_of :location

  def evaluateReading
    if self.readings[0]['temperature'] && ( self.readings[0]['temperature'] > self.maxTemp || self.readings[0]['temperature'] < self.minTemp)
      # flash[:notice] = "temperature is out of set range."
      # send email
      p self.readings[0]['temperature']
      p self.readings
      p self.maxTemp
      p self.minTemp
      p self
      #    end
    # puts 'test'*30
    end
  end

  def get_readings
    @response = []

    # @response = (HTTParty.get('http://secure-castle-3553.herokuapp.com/thermometers/1.json')).parsed_response
    @response = (HTTParty.get('http://secure-castle-3553.herokuapp.com/api.json')).parsed_response
    #  @response = (HTTParty.get('http://localhost:4000/thermometers/1.json')).parsed_response

    puts @response

      # why did i create a local var of reading? because i needed to set the temp for reading on a thermometer!
      # so once i get the json response i instantiate local var reading then set reading.temperature to = @response['temp']
      # which is the randomly generated temp reading from my api running on heroku.  Then save it.
    reading = Reading.new
    reading.temperature = @response["temp"]
    reading.save!
    self.readings << reading
    self.save!

  end
  # def initialize(location="",temperature="" )
  #   self.location = location
  #   self.temperature = temperature
  # end

end















