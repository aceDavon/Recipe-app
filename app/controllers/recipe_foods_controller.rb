class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe_food, only: %i[edit update]

  def new
    @recipe_foods = RecipeFood.new
  end

  # GET /recipes/1/edit
  def edit
    @recipe_foods
  end

  # POST /recipes or /recipes.json
  def create
    @recipe_foods = RecipeFood.new(recipe_foods_params)
    @recipe_foods.food_id = params[:foods][:id]
    @recipe_foods.recipe_id = params[:recipe_id]

    respond_to do |format|
      if @recipe_foods.save
        format.html do
          redirect_to user_recipes_path(current_user, @recipe), notice: 'Food was successfully added to Recipe.'
        end
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe_foods.update(recipe_foods_params)
        format.html do
          redirect_to user_recipes_path(current_user, @recipe), notice: 'Recipe was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe_foods = RecipeFood.find(params[:id])
    @recipe_foods.destroy

    respond_to do |format|
      format.html { redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_foods = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
