class FlagsController < ApplicationController
   before_action :admin?
   skip_before_action :admin?, only: [:show]

   def new
      @flag = Flag.new
   end

   def create
      if flag = Flag.create(flag_params)
         redirect_to flag_path(flag.id)
      else
         render 'new'
      end
   end

   def show
      @flag = Flag.find_by(id: params[:id])
   end

   private

   def flag_params
      params.require(:flag).permit(:nationality, :wikipedia_link, :name, :approved, :flag_pic)
   end
end