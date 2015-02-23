
class Reading < ActiveRecord::Base
  require 'httparty'
  require 'json'


  belongs_to :thermometer
  belongs_to :user

  # def get_readings
  #   @response = []
  #   # Thermometer.all.each do |thermo|
  #
  #     @response = (HTTParty.post('http://secure-castle-3553.herokuapp.com/thermometers/1.json')).parsed_response
  #   # @response = (HTTParty.post('http://localhost:4000/api')).parsed_response
  #   # @response = (HTTParty.post('http://localhost:4000/thermometers/1.json')).parsed_response
  #
  #   @tempData = @response[0]['temp']
  #      # puts @response
  #      #  @tempData
  # end
  # puts @response
end
