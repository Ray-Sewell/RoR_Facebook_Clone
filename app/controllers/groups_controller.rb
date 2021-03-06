class GroupsController < ApplicationController
    def index
        @groups = current_user.groups.all
        @group = current_user.created_groups.new
    end

    def new
        @group = current_user.created_groups.new
    end

    def create
        @group = current_user.created_groups.create(group_params)
    
        if @group.save
            GroupsUser.create(user_id: @group.leader.id, group_id: @group.id)
            redirect_back(fallback_location: root_path, notice: "Group was successfully created.")
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @group.update(group_params)
            redirect_to :back, notice: "Group was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to(root_path, notice: "Group was successfully destroyed.")
    end

    private
        def group_params
            params.require(:group).permit(:name)
        end
end
