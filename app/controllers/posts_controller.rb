class PostsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @posts = @user.posts
            @recommended_users = User.all
        elsif params[:group_id]
            @current_group = Group.find(params[:group_id])
            @user = current_user
            @posts = @current_group.posts
            @recommended_users = @current_group.users
        else
            @user = current_user
            @posts = Post.all
            @recommended_users = User.all
        end
        @post = Post.new
        @comment = Comment.new
        @group = Group.new
        @like = Like.new
        @invite = Invite.new
        @pending_invites = current_user.pending_invites
        @groups_user = GroupsUser.new
        @friend = Friend.new
        @friend_invite = FriendInvite.new
        @pending_friend_invites = current_user.pending_friend_invites
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
