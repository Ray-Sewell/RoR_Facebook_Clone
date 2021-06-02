class PostsController < ApplicationController
    before_action :authenticate_user!
    
    def show
    end
    def index
        @users = User.all
        if params[:user_id]
            @user = User.find(params[:user_id])
            @posts = @user.posts
        else
            @user = current_user
            @posts = Post.all
        end
        @post = current_user.posts.new
        @group = current_user.created_groups.new
    end
    def new
        @post = current_user.posts.new
    end
    def create
        @post = current_user.posts.create(post_params)
    
        if @post.save
            redirect_back(fallback_location: root_path, notice: "Post was successfully created.")
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @post.update(post_params)
            redirect_to :back, notice: "Post was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_back(fallback_location: root_path, notice: "Post was successfully destroyed.")
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
