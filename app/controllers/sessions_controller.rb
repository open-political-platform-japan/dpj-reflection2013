class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params[:user] || {}
    login(user_params[:username], user_params[:password])
    if logged_in?
      redirect_to root_url, notice: "ログインしました。"
    else
      flash.now[:alert] = "ログインできません。"
      @user = User.new(params[:user])
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "ログアウトしました。"
  end
end
