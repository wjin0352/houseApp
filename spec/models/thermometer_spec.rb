require 'rails_helper'
	

	describe Thermometer do

		it "is valid with a location, minTemp, and maxTemp" do
			thermometer = Thermometer.create(
					location: 'home',
					minTemp: 88,
					maxTemp: 92
				)
			# thermometer.valid?
			expect(thermometer).to be_valid
		end


		before :each do 
			@thermometer = Thermometer.create(
	  	  location: nil, 
	  		minTemp: nil,
	  		maxTemp: nil,
	  		)
		end

	  it "is invalid without a minTemp" do
	  	expect(@thermometer.errors[:minTemp]).to include("can't be blank")
	  end
	  
	  it "is invalid without a maxTemp" do
	  	expect(@thermometer.errors[:maxTemp]).to include("can't be blank")
	  end

	  it "is invalid without a location" do
	  	expect(@thermometer.errors[:location]).to include("can't be blank")
	end
end
