class Station < ApplicationRecord
    has_many :measurements, dependent: :destroy
end
