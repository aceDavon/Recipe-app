class ShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.where(id: params[:recipe_id])
    @price_data = 0
    @food_len = 0
    @prices = @recipes.includes(:foods, :recipe_foods).each_with_index do |p, i|
      @price_data += p.foods[i].price.to_i * p.recipe_foods[i].quantity.to_i
    end
    @food_arr = @recipes.includes(:foods).each do |p|
      @food_len = p.foods.length
    end
  end
end
