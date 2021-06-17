class FriendsController < ApplicationController
    def create
        @user_1 = User.find(params[:friend][:user_id])
        @user_2 = User.find(params[:friend][:friend_id])
        @user_1.friends.create(friend_id:@user_2.id)
        @user_2.friends.create(friend_id:@user_1.id)
        redirect_back(fallback_location: root_path, notice: "Friend invite was accepted.")
    end

    private
        def friend_params
            params.require(:friend).permit(:user_id, :friend_id)
        end
end
