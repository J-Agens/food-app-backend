class CookSessionsController < ApplicationController
  def index
    @cook_sessions = CookSession.all
    render json: @cook_sessions
  end

  def show
    @cook_session = CookSession.find_by(id: params[:id])
    render json: @cook_session
  end

  def create
    empty_pots = Pot.all.select do |pot|
      pot.cook_session == nil
    end
    if empty_pots.count > 0
      @cook_session = CookSession.new(order_id: params[:order][:id], pot_id: empty_pots[0].id, completed: false, chef_id: params[:chef_id])
      rec = Recipe.find_by(name: params[:order][:item_name])
      chef = User.find_by(id: params[:chef_id])
      order = Order.find_by(id: params[:order][:id])
      payment = order.price
      chef.update(wallet: chef.wallet + payment)
      @cook_session.recipe_id = rec.id
      if @cook_session.save
        render json: @cook_session
      else
        render json: {error: "You already selected this order."}
      end
    else
      render json: {error: "No more empty pots."}
    end
  end

  def update
    @cook_session = CookSession.find_by(id: params[:id])
    @cook_session.update(completed: true)
    order = @cook_session.order
    order.update(served: true)
    ActionCable.server.broadcast("tables_channel", OrderSerializer.new(order))
    @cook_session.destroy
  end

  def destroy
    @cook_session = CookSession.find_by(id: params[:id])
    @cook_session.destroy
    # render json: @cook_session
  end
end
