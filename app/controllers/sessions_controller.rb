class SessionsController < ApplicationController
   skip_before_action :verified_user, only: [:new, :create, :github_oauth]

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
      @omniauth_data = request.env['omniauth.auth']
      
      if @user = User.where(github_id: @omniauth_data["uid"], github: true).first
         session[:user_id] = @user.id
         redirect_to user_path(@user.id)
      else
         user_full_name = @omniauth_data["info"]["name"].split
         
         @user = User.create(
            email: "input your email",
            password: @omniauth_data["uid"],
            username: @omniauth_data["info"]["nickname"],
            first_name: user_full_name[0],
            last_name: user_full_name[1],
            age: 0,
            skype_username: "input your Skype username",
            github: true,
            github_id: @omniauth_data["uid"],
            github_profile_pic: @omniauth_data["info"]["image"]
         )
         session[:user_id] = @user.id
         redirect_to edit_user_path(@user.id)
      end
   end

   def destroy
      session.delete("user_id")
      redirect_to root_path
   end
end