class MeasurementsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_station
    before_action :set_measurement, only: [:edit, :update, :destroy]

    def index
        @measurements = @station.measurements.order(:rank)
    end

    def new
        @dimensions_list = Dimension.list
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

    def edit
        @dimensions_list = Dimension.list
    end

    def update
        if @measurement.update(measurement_params)
            redirect_to station_measurements_path(@station)
        else
            render :edit
        end
    end

    def destroy
        @measurement.destroy
        redirect_to station_measurements_path(@station)
    end

    private

    def set_station
        @station = Station.find(params[:station_id])
    end

    def set_measurement
        @measurement = Measurement.find(params[:id])
    end    

    def measurement_params
        params.require(:measurement).permit(:dimension_id, :influx_id, :calibration, :coefficient, :rank)
    end

end
