class FriendInvitesController < ApplicationController
    def create
        @existing_invite = FriendInvite.where("reciever_id= ? and sender_id= ?", (params[:friend_invite][:reciever_id]), (params[:friend_invite][:sender_id])).any?
        if @existing_invite
            redirect_back(fallback_location: root_path, alert: "You have already sent this user an invite, please wait for a response.")
        else
            @friend_invite = FriendInvite.create(friend_invite_params)
            redirect_back(fallback_location: root_path, notice: "Invite was sent.")
        end
    end
    def destroy
        @friend_invite = FriendInvite.find(params[:id])
        @friend_invite.destroy
        redirect_back(fallback_location: root_path, notice: "Invite was rejected.")
    end
    private
        def friend_invite_params
            params.require(:friend_invite).permit(:sender_id, :reciever_id)
        end
end
