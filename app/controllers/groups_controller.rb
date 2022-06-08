class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
  end

  def index
    @book = Book.new
    @groups = Group.all
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end


private

  def group pramas
  params.require(:groups).permit(:name, :introduction, :image)
  end
end
