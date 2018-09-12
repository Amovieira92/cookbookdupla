class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id]) 
  end

  def new
    @recipe = Recipe.new
  end

  def create
    
    attributes = params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)

    @recipe = Recipe.new(attributes)

    @recipe.save
    
    redirect_to @recipe
  end

end  