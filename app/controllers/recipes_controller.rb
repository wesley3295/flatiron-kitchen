class RecipesController < ApplicationController
    before_action :find_recipes, only: [:show,:edit,:update,:delete]

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all

    end

    def create
        recipe = Recipe.new(recipe_params)
        if recipe.save
            redirect_to recipe_path(recipe)
        else
            render :new
        end
    end

    def show
    end

    def index
        @recipes = Recipe.all
    end

    def edit
        @ingredients = Ingredient.all
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def delete
    end

    private
    def find_recipes
        @recipe = Recipe.find_by(params[:id])
    end
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end
end
