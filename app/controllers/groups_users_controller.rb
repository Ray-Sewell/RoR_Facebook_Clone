class GroupsUsersController < ApplicationController
    def create
        @groups_user = GroupsUser.create(group_user_params)
        @groups_user.save
        redirect_back(fallback_location: root_path, notice: "Invite to was accepted.")
    end

    private
        def group_user_params
            params.require(:groups_user).permit(:user_id, :group_id)
        end
end
