class DimensionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dimension, only: [:edit, :update, :destroy]

    def index
        @dimensions = Dimension.order(:name)
    end

    def new
        @dimension = Dimension.new
    end

    def create
        @dimension = Dimension.new(dimension_params)
        if @dimension.save
            redirect_to dimensions_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @dimension.update(dimension_params)
            redirect_to dimensions_path
        else
            render :edit
        end
    end

    def destroy
        @dimension.destroy
        redirect_to dimensions_path
    end
    
    private

    def dimension_params
        params.require(:dimension).permit(:name, :unit, :category, :guideline, :description)
    end

    def set_dimension
        @dimension = Dimension.find(params[:id])
    end  
end
