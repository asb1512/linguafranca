class LanguagesController < ApplicationController
   before_action :admin?
   skip_before_action :admin?, only: [:show]

   def new
      @language = Language.new
   end

   def create
      if language = Language.create(language_params)
         redirect_to language_path(language)
      else
         render 'new'
      end
   end
   
   def show
      @language = Language.find_by(id: params[:id])
   end

   def edit
      @language = Language.find_by(id: params[:id])
   end

   def update
      language = Language.find_by(id: params[:id])
      language.update(language_params)
      redirect_to language_path(language.id)
   end

   def destroy
      language = Language.find_by(id: params[:id])
      if current_user.admin
         language.destroy
         redirect_to admin_dashboard_path
      else
         language.destroy
         redirect_to root_path
      end
   end

   def approve
      if @language = language.find_by(id: params[:id])
         @language.approved = true
         @language.save
         redirect_to language_path(@language.id)
      else
         render 'show'
      end
   end

   private

   def language_params
      params.require(:language).permit(:name, :pitched, :gendered, :wikipedia_link, flag_ids: [])
   end
end