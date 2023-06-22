class SpicesController < ApplicationController
    before_action :find_spice, only: [:show, :update, :destroy]
  
    def index
      spices = Spice.all
      render json: spices
    end
  
    def create
      spice = Spice.new(spice_params)
      if spice.save
        render json: spice, status: :created
      else
        render json: { error: "Failed to create spice" }, status: :unprocessable_entity
      end
    end
  
    def update
      if @spice.update(spice_params)
        render json: @spice
      else
        render json: { error: "Failed to update spice" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @spice.destroy
      head :no_content
    end
  
    private
  
    def find_spice
      @spice = Spice.find(params[:id])
    end
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
  end
  