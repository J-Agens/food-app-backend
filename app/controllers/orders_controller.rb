class OrdersController < ApplicationController
  def create
    @order = Order.new(item_name: params[:item_name], served: false, price: params[:price], user_id: params[:user_id], table_id: params[:table_id])

    if @order.save
      ActionCable.server.broadcast("order_board_channel", OrderSerializer.new(@order))
      # render json: @order, status: 201
    else
      render json: {error: "This is not your table."}
    end
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

  def erase_orders
    Order.destroy_all
    render json: {message: "It is done."}
  end
end
