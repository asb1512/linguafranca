class InvitationsController < ApplicationController
   def create
      invitation = Invitation.create(user_id: current_user.id, friend_id: params[:id])
      if invitation
         redirect_to user_path(params[:id])
      else
         redirect_to user_path(current_user)
      end
   end
end