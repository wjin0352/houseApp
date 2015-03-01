# require 'rails_helper'
# require 'capybara/poltergeist'
# include Warden::Test::Helpers
# Warden.test_mode!
# Capybara.javascript_driver = :poltergeist
#
#
# RSpec.feature "Deleting thermometers", :js => true do
#   before do
#     # @user = FactoryGirl.create(:user)
#     # @thermometer = FactoryGirl.create(:thermometer)
#     user = FactoryGirl.create(:user)
#     login_as(user, :scope => :user)
#     user.confirmed_at = Time.now
#     user.save
#
#     puts 'yut '*20
#
#     visit '/'
#     click_link 'Sign in'
#
#     fill_in "user_email", with: "w@gmail.com"
#     fill_in "user_password", with: 'myson0352'
#
#     click_button "login"
#     page.driver.render('./file.png', :full => true)
#
#     click_link "create"
#     fill_in "thermometer_location", with: "couch"
#     fill_in "thermometer_temperature", with: 66
#     click_button "thermometer_new"
#
#   end
#
#   scenario "A user can delete a thermometer" do
#
#     visit user_thermometer_path([@user, @thermometer])
#
#     click_link 'delete'
#
#     expect(page).to have_content('thermometer was deleted')
#   end
# end