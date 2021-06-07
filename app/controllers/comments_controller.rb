class CommentsController < ApplicationController
    def create
        @comment = Comment.create(comment_params)
    
        if @comment.save
            redirect_back(fallback_location: root_path, notice: "Comment was successfully created.")
        else
            redirect_back(fallback_location: root_path, notice: "Comment could not be saved.")
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:body, :author_id, :post_id)
        end
end
