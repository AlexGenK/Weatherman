class GetMeasurementsListQuery
	def self.call(station)
        measurements = station.measurements.order(:rank)
        measurements.group_by{|measurement| measurement.dimension.category}
    end
end