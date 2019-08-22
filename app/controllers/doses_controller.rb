class DosesController < ApplicationController
  before_action :fetch_dose, only: [:destroy]
  before_action :fetch_cocktail, only: [:new, :create]

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    @cocktail = @dose.cocktail
    redirect_to @cocktail
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def fetch_dose
    @dose = Dose.find(params[:id])
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
