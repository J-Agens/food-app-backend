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
    @cook_session = CookSession.new(order_id: params[:order][:id], pot_id: params[:cook_session][:pot_id], completed: false)
    rec = Recipe.find_by(name: params[:order][:item_name])
    @cook_session.recipe_id = rec.id
    @cook_session.save
    render json: @cook_session
  end

  def update
    @cook_session = CookSession.find_by(id: params[:id])
    @cook_session.update(completed: true)
    order = @cook_session.order
    order.update(served: true)
    @cook_session.destroy
  end

  def destroy
    @cook_session = CookSession.find_by(id: params[:id])
    @cook_session.destroy
    # render json: @cook_session
  end
end
