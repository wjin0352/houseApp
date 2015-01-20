# class UserviewController < ApplicationController
#   before_filter :authenticate_user!
#
#   def index
#     @users = User.all
#   end
#
#   def new
#
#   end
#
#   def create
#     @user = User.new(user_params)
#
#     respond_to do |format|
#       if @user.save
#         format.html {}
#         format.json {}
#       else
#         format.html {}
#         format.json {}
#       end
#     end
#     end
#
#   def edit
#
#   end
#
#   def destroy
#
#   end
#
#   private
#
#     def set_user
#       @user = User.find(params[:id])
#     end
#
#     def user_params
#       params.require(:@user).permit(:name, :email)
#     end
#
# end
