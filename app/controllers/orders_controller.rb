class OrdersController < ApplicationController
  def create
    @order = Order.new(item_name: params[:item_name], served: false, price: params[:price], user_id: params[:user_id], table_id: params[:table_id])
    byebug
    @order.save
    ActionCable.server.broadcast("order_board_channel", OrderSerializer.new(@order))
    # render json: @order, status: 201
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.update(served: params[:served])
    render json: @order, status: 201
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render json: @order
  end
end
