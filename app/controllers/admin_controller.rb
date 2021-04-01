class AdminController < ApplicationController
   before_action :admin?

   def dashboard
      @users = User.all
      @languages = Language.all
      @nations = Flag.all
   end

   def new_user
      @user = User.new
   end

   def create_user
      if user = User.create(user_params)
   end

   private

   def user_params
      params.require(:user).permit(
         :email,
         :password,
         :password_confirmation,
         :username,
         :first_name,
         :last_name,
         :age,
         :skype_username,
         :native_language_id,
         :foreign_language_id,
         :profile_pic,
         :admin
      )
   end
end