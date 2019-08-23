class CocktailsController < ApplicationController
  before_action :fetch_cocktail, except: [:index, :new, :create]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to @cocktail
  end

  private

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
