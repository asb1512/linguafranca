class AdminController < ApplicationController
   before_action :admin?

   def dashboard
      @users = User.all
      @languages = Language.all
      @nations = Flag.all
   end

   def new_user
      @user = User.new
      @approved_languages = Language.where(approved: true)
   end

   def create_user
      user = User.new(new_user_params)
      
      if user.save
         binding.pry
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
         binding.pry
         render :new_user
      end
   end

   private

   def new_user_params
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