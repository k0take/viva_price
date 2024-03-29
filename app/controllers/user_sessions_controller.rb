class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to products_path, notice: t('.login_success')
    else
      flash.now[:alert] = t('.login_failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: t('.logout_success')
  end
end
