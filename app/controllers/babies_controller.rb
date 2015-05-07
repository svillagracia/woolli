class BabiesController < ApplicationController

  before_action :is_authenticated?


  def index
    @babies = current_user.babies
  end


  def new
    @baby = Baby.new
  end


  def show
    p params[:id]
    @baby = Baby.find(params[:id])
  end


  def create
    @baby = current_user.babies.create(baby_params)
    redirect_to @baby
  end


  private

  def baby_params
    params.require(:baby).permit(:name,:birthday)
  end

end