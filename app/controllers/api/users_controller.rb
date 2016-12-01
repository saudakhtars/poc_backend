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
    binding.pry
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = 'Welcome!'
      render json: { auth_token: @user.generate_auth_token }
    else
      render json: { error: 'Invalid User' }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
