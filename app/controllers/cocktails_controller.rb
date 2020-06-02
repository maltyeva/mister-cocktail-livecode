class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.order(name: :asc)
  end

  def show
    # cocktails/5
    @cocktail = Cocktail.find(params[:id])
  end

  def filter
    # ?ingredient="Apple+Juice"
    @ingredient = Ingredient.find_by(name: params[:ingredient])
    @cocktails = @ingredient.cocktails
  end

  def new
    # blank form with cocktail object
    @cocktail = Cocktail.new
  end

  def create
    # form with data filled out
    @cocktail = Cocktail.new(cocktail_params)
    # save
    if @cocktail.save
      redirect_to @cocktail
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
