class PotsController < ApplicationController
  def index
    @pots = Pot.all
    render json: @pots
  end
end
