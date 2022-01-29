class DimensionsController < ApplicationController
    before_action :set_station, only: [:edit, :update, :destroy]

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
    
    private

    def dimension_params
        params.require(:dimension).permit(:name, :unit, :category, :guideline)
    end

    def set_dimension
        @dimension = Dimension.find(params[:id])
    end  
end
