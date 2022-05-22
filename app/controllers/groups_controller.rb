class GroupsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.transaction do
      @group.save!
      current_user.group_users.create!(group_id: @group.id)
    end
    # トランザクション成功時の処理
      redirect_to groups_path
    rescue => e
    # トランザクション失敗時の処理
      render :new
  end

  def index
    @book = Book.new
    @groups = Group.all
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to groups_path
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    group = Group.find(params[:id])
    if group.owner_id != current_user.id
      redirect_to groups_path
    end
  end

end
