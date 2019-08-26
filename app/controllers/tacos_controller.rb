class TacosController < ApplicationController
  before_action :set_taco, only: [:show, :update, :edit, :destroy]

  def index
    @tacos = current_user.tacos
  end

  def show
  end

  def new
    @taco = Taco.new
    render :template => "tacos/_form"
  end

  def create
    @taco = current_user.tacos.new(taco_params)

    if @taco.save
      flash[:success] = "Taco Created!!"
      redirect_to tacos_path
    else
      flash[:error] = "Error #{@taco.errors.full_messages.join("\n")}"
      render :template => "tacos/_form"
    end
  end

  def edit
    render :template => "tacos/_form"
  end

  def update
    if @taco.update(taco_params)
      flash[:success] = "Taco Updated!!"
      redirect_to tacos_path
    else
      flash[:error] = "Error: #{@taco.errors.full_messages.join("\n")}"
      render :template => "tacos/_form"
    end
  end

  def destroy
    @taco.destroy
    redirect_to tacos_path
    flash[:deleted] = "Taco deleted..."
  end

  private
    def set_taco
      @taco = current_user.tacos.find(params[:id])
    end

    def taco_params
      params.require(:taco).permit(:name, :value)
    end
end
