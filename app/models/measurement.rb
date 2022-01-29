class Measurement < ApplicationRecord
  belongs_to :station
  belongs_to :dimension
end
