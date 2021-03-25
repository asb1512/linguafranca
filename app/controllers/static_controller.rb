class StaticController < ApplicationController
   skip_before_action :verified_user

   def welcome
   end

   def home
      @matching_users = User.matching_users(current_user)
   end

   def about
   end
end