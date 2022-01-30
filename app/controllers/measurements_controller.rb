class MeasurementsController < ApplicationController
    before_action :set_station

    def index
        @measurements = @station.measurements.order(:rank)
    end

    def new
        @dimensions_list = Dimension.order(:name).collect {|p| [p.name, p.id]} 
        @dimension=Dimension.find(@dimensions_list[0][1])
        @measurement = @station.measurements.new(dimension_id: @dimension.id)
    end

    def create
        @measurement = @station.measurements.new(measurement_params)
        if @measurement.save
            redirect_to station_measurements_path(@station)
        else
            render :new
        end
    end

    private

    def set_station
        @station = Station.find(params[:station_id])
    end

    def measurement_params
        params.require(:measurement).permit(:dimension_id, :influx_id, :calibration, :coefficient, :rank)
    end

end
