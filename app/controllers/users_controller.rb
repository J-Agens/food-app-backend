class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(username: params[:username], password: params[:password], wallet: 60)
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

  def pay_bill
    @user = User.find_by(id: params[:id])
    prices = []
    order_ids = []
    @user.orders.each do |order|
      prices.push(order.price)
      order_ids.push(order.id)
      order.destroy
    end
    total = prices.sum
    info_hash = {total: total, order_ids: order_ids, user_id: @user.id}
    ActionCable.server.broadcast("pay_channel", info_hash)
    render json: {total: total, order_ids: order_ids }
  end

end
