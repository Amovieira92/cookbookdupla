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

    if @recipe.save
      redirect_to @recipe  
    else
      @recipe_types = RecipeType.all
      render "new"
    end

  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_types = RecipeType.all
  end

  def update
    attributes = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)

    @recipe = Recipe.find(params[:id])

    if @recipe.update(attributes)
      flash[:info] = "Receita marcada como destaque com sucesso!"
      redirect_to @recipe
    else
      @recipe_types = RecipeType.all
      render "edit"
    end

  end

end  