class SessionsController < ApplicationController
   skip_before_action :verified_user, only: [:new, :create]

   def new
      if current_user
         redirect_to user_path(current_user)
      else
         @user = User.new
      end
   end

   def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         render 'new'
      end
   end

   def destroy

   end
end