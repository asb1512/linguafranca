class UsersController < ApplicationController
   skip_before_action :verified_user, only: [:new, :create]

   def new
      @user = User.new
   end

   def create
      if (user = User.create(user_params))
         session[:user_id] = user.id
         native_language = LanguageUser.create(
            language_id: params[:native_language_id],
            user_id: user.id,
            foreign_language: false
         )
         foreign_language = LanguageUser.create(
            language_id: params[:foreign_language_id],
            user_id: user.id,
            foreign_language: true
         )
         redirect_to user_path(user)
       else
         render 'new'
       end
   end

   def show
      @user = User.find_by(id: params[:id])
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
         :profile_pic
      )
   end
end