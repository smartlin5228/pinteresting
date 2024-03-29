class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = current_user.pin.build
  end

  def edit
  end

  def create
    @pin = urrent_user.pin.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end
    def correct_user
      @pin = current_user.pins.find(params[:id])
      redirect_to pins_path, notice: "Not Authorized to access this pin" if @pin.nil?
    end
    def pin_params
      params.require(:pin).permit(:description)
    end
end
