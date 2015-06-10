class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end
  
  def edit
    @group = Group.find(params[:id])
  end

  def create
     @group = Group.create(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if
      @group.destroy
      redirect_to groups_path, alert: "刪除成功"
    else
      render :index
    end
  end
end

private
  
  def group_params 
      params.require(:group).permit(:title, :description)
  end

