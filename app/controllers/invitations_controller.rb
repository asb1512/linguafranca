class InvitationsController < ApplicationController
   def create
      invitation = Invitation.create(user_id: current_user.id, friend_id: params[:id])
      if invitation
         redirect_to user_path(params[:id])
      else
         redirect_to user_path(current_user)
      end
   end

   def index
      if params[:user_id]
         @pending_invitations = User.find_by(id: params[:user_id]).pending_invitations
         @pending_users = []
         @pending_invitations.each do |p|
            user = User.find_by(id: p.friend_id)
            @pending_users << user
         end
         @pending_users
      else
         redirect_to user_path(params[:user_id])
      end
   end

   def update
      
   end
end