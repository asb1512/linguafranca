class FlagsController < ApplicationController
   before_action :admin?
   skip_before_action :admin?, only: [:show]

   def show
      @flag = Flag.find_by(id: params[:id])
   end
end