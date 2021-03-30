class AdminController < ApplicationController
   before_action :admin?

   def dashboard
      @users = User.all
      @languages = Language.all
      @nations = Flag.all
   end
end