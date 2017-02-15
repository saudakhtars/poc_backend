class Api::UsersController < ApplicationController
  skip_before_action :require_login, :authenticate_request, only: [:new, :create]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = 'Welcome!'
      render json: { auth_token: @user.generate_auth_token }
    else
      render json: { error: 'Invalid User' }, status: 404
    end
  end

  def get_current_user
    user = {id: current_user.id,
            first_name: current_user.first_name,
            last_name: current_user.last_name,
            email: current_user.email}
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
