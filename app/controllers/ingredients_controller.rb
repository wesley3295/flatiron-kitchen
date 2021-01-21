class IngredientsController < ApplicationController
    before_action :find_ingredients, only: [:show,:edit,:update,:delete]

    def new
        @ingredient = Ingredient.new
    end

    def create
        ingredient = Ingredient.new(ingredient_params)
        if ingredient.save
            redirect_to ingredient_path(ingredient)
        else
            render :new
        end
    end

    def show
    end

    def index
        @ingredients = Ingredient.all
    end

    def edit
    end

    def update
        if @ingredient.update(ingredient_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def delete
    end

    private
    def find_ingredients
        @ingredient = Ingredient.find_by(params[:id])
    end
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
