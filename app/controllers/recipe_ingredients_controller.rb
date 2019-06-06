class RecipeIngredientsController < ApplicationController
  def index
    @rec_ings = RecipeIngredient.all
    render json: @rec_ings
  end
end
