class CommentsController < ApplicationController
    def create
        @comment = Comment.create(comment_params)
    
        if @comment.save
            redirect_back(fallback_location: root_path, notice: "Comment was successfully created.")
        else
            redirect_back(fallback_location: root_path, alert: "Comment could not be saved.")
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if current_user == @comment.author
            @comment.destroy
            redirect_back(fallback_location: root_path, notice: "Comment was successfully destroyed.")
        else
            redirect_back(fallback_location: root_path, alert: "You must be the owner of this comment to destroy it.")
        end
    end


    private
        def comment_params
            params.require(:comment).permit(:body, :author_id, :post_id)
        end
end
