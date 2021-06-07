class LikesController < ApplicationController
    def create
        @like = Like.create(like_params)
        @like.save
    end

    private
        def like_params
            params.require(:like).permit(:user_id, :post_id)
        end
end
