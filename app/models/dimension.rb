class Dimension < ApplicationRecord
    has_many :measurements

    def self.list
        self.order(:name).collect {|p| [p.name, p.id]}
    end
end
