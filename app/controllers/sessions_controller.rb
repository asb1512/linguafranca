class SessionsController < ApplicationController
   skip_before_action :verified_user, only: [:new, :create]

   def new
      if current_user
         redirect_to home_path
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
         @signin_failure = "Your email and/or password did not match our records."
         render 'new'
      end
   end

   def github_oauth
      pp request.env['omniauth.auth']
   end

   def destroy
      session.delete("user_id")
      redirect_to root_path
   end
end