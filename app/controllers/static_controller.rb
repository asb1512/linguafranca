class StaticController < ApplicationController
   skip_before_action :verified_user

   def welcome
   end

   def home
   end

   def about
   end
end