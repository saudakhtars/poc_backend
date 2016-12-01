class Api::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  skip_before_action :require_login, :authenticate_request, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by_email(params[:email].downcase)
    if login(params[:email], params[:password])
      render json: { auth_token: @user.generate_auth_token }
    else
      render json: { error: 'E-mail and/or password is incorrect.' }, status: 404
    end
  end

  def destroy
    logout
    render json: { message: 'Bye! See you Again!' }
  end
end
