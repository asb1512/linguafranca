class UsersController < ApplicationController
   def new

   end

   def create

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
         :skype_username
      )
   end
end