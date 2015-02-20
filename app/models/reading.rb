
class Reading < ActiveRecord::Base
  require 'json'

  belongs_to :thermometer
  belongs_to :user

  def get_readings
    Thermometer.all.each do |thermo|

        response  = HTTParty.get("https://secure-castle-3553.herokuapp.com/thermometers.json")
        puts response.inspect

         response = JSON.parse
         puts response.body.inspect

    end
  end


end
