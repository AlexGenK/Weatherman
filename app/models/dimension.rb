class Dimension < ApplicationRecord
    has_many :measurements

    def self.list
        Dimension.order(:name).collect {|p| [p.name, p.id]}
    end
end
