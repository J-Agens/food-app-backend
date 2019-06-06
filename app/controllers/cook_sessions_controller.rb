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
    @cook_session = CookSession.new(recipe_id: params[:recipe_id], order_id: params[:order_id], pot_id: params[:pot_id])
    @cook_session.save
    render json: @cook_session
  end

  def update
  end

  def destroy

  end
end
