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

   def edit
      @flag = Flag.find_by(id: params[:id])
   end

   def update
      flag = Flag.find_by(id: params[:id])
      flag.update(flag_params)
      redirect_to flag_path(flag.id)
   end

   def approve
      if @flag = Flag.find_by(id: params[:id])
         @flag.approved = true
         @flag.save
         redirect_to flag_path(@flag.id)
      else
         render 'show'
      end
   end

   private

   def flag_params
      params.require(:flag).permit(:nationality, :wikipedia_link, :name, :approved, :flag_pic, language_ids: [])
   end
end