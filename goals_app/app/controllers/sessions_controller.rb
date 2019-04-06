class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], )

    redirect_to user_url(user)
  end

  def destroy
    log_out_user!
    render :new
  end
end