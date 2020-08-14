class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save!

    redirect_to cocktail_path(@cocktail)
  end

  private 

  def seed_simple_form 
    @cocktail.doses.new if @cocktail.doses.none?
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
