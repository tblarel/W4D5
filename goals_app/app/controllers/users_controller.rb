class UsersController < ApplicationController
  def index
    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def update
    # @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
