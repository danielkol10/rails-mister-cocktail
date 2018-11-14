class DosesController < ApplicationController
  # before_action :set_dose, only: [:show]
  before_action :set_cocktail, only: [:new, :create]
  before_action :set_dose, only: [:destroy]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to @cocktail, notice: 'dose was successfully created.'
      else
        render :new
      end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was destroyed.'
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
