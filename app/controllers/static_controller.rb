class StaticController < ApplicationController
   skip_before_action :verified_user

   def welcome
   end

   def about
   end
end