class PostsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
        if params[:user_id]
            @user = User.find(params[:user_id])
            @posts = @user.posts
        elsif params[:group_id]
            @current_group = Group.find(params[:group_id])
            @user = current_user
            @posts = @current_group.posts
        else
            @user = current_user
            @posts = Post.all
        end
        @post = Post.new
        @comment = Comment.new
        @group = Group.new
        @like = Like.new
        @invite = Invite.new
    end
    def new
        @post = current_user.posts.new
    end
    def create
        @post = Post.new(post_params)
        unless @post.group_id.empty?
            @current_group = Group.find(@post.group_id)
            @post = @current_group.posts.create(post_params)
        end

        if @post.save
            redirect_back(fallback_location: root_path, notice: "Post was successfully created.")
        else
            render "form", status: :unprocessable_entity
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
        if current_user == @post.author
            @post.destroy
            redirect_back(fallback_location: root_path, notice: "Post was successfully destroyed.")
        else
            redirect_back(fallback_location: root_path, alert: "You must be the owner of this post to destroy it.")
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :body, :author_id, :group_id)
        end
end
