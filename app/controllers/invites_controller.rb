class InvitesController < ApplicationController
    def create
        @user = User.find_by name:(params[:invite][:invitee_id])
        @group = Group.find(params[:invite][:group_id])
        if @user
            if @user.groups.include?(@group)
                redirect_back(fallback_location: root_path, alert: "User already joined.")
            elsif Invite.where("invitee_id= ? and group_id= ?", @user.id, @group.id).any?
                redirect_back(fallback_location: root_path, alert: "User already invited.")
            else
                params[:invite][:invitee_id] = @user.id
                @invite = Invite.new(invite_params)
                if @invite.save
                    redirect_back(fallback_location: root_path, notice: "Invite sent.")
                else
                    redirect_back(fallback_location: root_path, alert: "Failed to send invite.")
                end
            end
        else
            redirect_back(fallback_location: root_path, alert: "Failed to find user.")
        end
    end
    def destroy
        @invite = Invite.find(params[:id])
        @invite.destroy
        redirect_back(fallback_location: root_path, notice: "Invite was rejected.")
    end
    private
        def invite_params
            params.require(:invite).permit(:invitee_id, :sender_id, :group_id)
        end
end
