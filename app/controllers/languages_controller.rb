class LanguagesController < ApplicationController
   def show
      @language = Language.find_by(id: params[:id])
   end
end