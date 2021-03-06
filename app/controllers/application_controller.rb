class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :verified_user
   helper_method :current_user

   private

   def verified_user
      redirect_to root_path unless user_is_authenticated
   end

   def user_is_authenticated
      !!current_user
   end

   def current_user
      User.find_by(id: session[:user_id])
   end

   def admin?
      render file: "public/422.html", status: 422 unless current_user.admin == true
   end
end
