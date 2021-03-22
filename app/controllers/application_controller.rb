class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :verified_user
   helper_method :current_user

   private

   def verified_user
      redi
   end
end
