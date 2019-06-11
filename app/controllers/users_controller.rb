class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    @user.save
    render json: @user
  end

  def update
    # @user = User.find_by(id: params[:id])
    # @user.update()
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end
