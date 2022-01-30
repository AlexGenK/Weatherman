class Station < ApplicationRecord
    has_many :measurements, dependent: :destroy

    def self.list
        self.order(:name).collect {|p| [p.name, p.influx_id]}
    end
end
