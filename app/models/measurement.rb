class Measurement < ApplicationRecord
  belongs_to :station
  belongs_to :dimension

  def corrected(meas)
    self.coefficient||=1
    (meas+calibration)*coefficient
  end
end
