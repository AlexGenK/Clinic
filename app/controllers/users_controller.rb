class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]
  load_and_authorize_resource

  def index
    @users = User.order(:username)
  end

  def edit
    @cat_list = Category.all.collect {|cat| [cat.name, cat.id]}
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      flash[:alert] = 'Unable to edit user'
      @cat_list = Category.all.collect {|cat| [cat.name, cat.id]}
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :phone, :user_role, :doctor_role, :admin_role, :category_id)
  end
end
