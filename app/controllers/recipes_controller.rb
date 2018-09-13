class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id]) 
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
  end

  def create
    
    attributes = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)

    @recipe = Recipe.new(attributes)

    @recipe.save
    
    redirect_to @recipe
  end

end  