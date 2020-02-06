class OrdersController < ApplicationController
  def create
    @order = Order.new(item_name: params[:item_name], served: false, price: params[:price], user_id: params[:user_id], table_id: params[:table_id])

    # Check to see if order passes validations
    if @order.save
      #
      ActionCable.server.broadcast("order_board_channel", OrderSerializer.new(@order))
      # render json: @order, status: 201
    else
      render json: {body: "This is not your table."}, status: 201
    end
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.update(served: params[:served])
    render json: @order, status: 201
  end

  # Using cancel method instead of destroy. Ran into a problem in development.
  # Paid orders are destroyed in pay_bill action in users_controller.rb.
  def destroy
    @order = Order.find(params[:id])
    info_hash = {total: @order.price, order_ids: [@order.id], user_id: @order.user_id}
    @order.destroy
    # render json: @order
    ActionCable.server.broadcast("pay_channel", info_hash)
  end

  def cancel
    @order = Order.find(params[:id])
    info_hash = {total: @order.price, order_ids: [@order.id], user_id: @order.user_id}
    @order.destroy
    # render json: @order
    ActionCable.server.broadcast("pay_channel", info_hash)
  end

  def erase_orders
    Order.destroy_all
    render json: {message: "It is done."}
  end
end
