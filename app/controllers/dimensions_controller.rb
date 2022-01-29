class DimensionsController < ApplicationController
    def index
        @dimensions = Dimension.order(:name)
    end
    
    private

    def dimension_params
        params.require(:station).permit(:name, :unit, :category, :guideline)
    end

    def set_dimension
        @dimension = Dimension.find(params[:id])
    end  
end
