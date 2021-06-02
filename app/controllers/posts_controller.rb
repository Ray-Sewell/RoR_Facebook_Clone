class PostsController < ApplicationController
    def show
    end
    def index
        @posts = Post.all
        @post = Post.new
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.create(post_params)
    
        if @post.save
            redirect_to @post, notice: "Post was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_url, notice: "Post was successfully destroyed."
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
