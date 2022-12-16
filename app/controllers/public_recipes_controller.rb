class PublicRecipesController < ApplicationController
  def public_recipes
    @recipes = Recipe.includes(:user).where(public: false)
  end
end
