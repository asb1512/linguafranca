class UsersController < ApplicationController
   skip_before_action :verified_user, only: [:new, :create]

   def new
      @user = User.new
      @approved_languages = Language.where(approved: true)
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
      @pending_invitations = @user.pending_invitations
   end

   def edit
      if current_user.admin || current_user.id == params[:id].to_i
         @user = User.find_by(id: params[:id])
         @approved_languages = Language.where(approved: true)
      else
         render file: "public/422.html", status: 404
      end
   end

   def update
      user = User.find_by(id: params[:id])
      user.update(user_params)
      redirect_to user_path(user)
   end

   def home
      @matching_users = User.matching_users(current_user)
   end

   def friends
      @friends = current_user.friends
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