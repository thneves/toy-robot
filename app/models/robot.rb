class Robot < ApplicationRecord

  validates :x_location, presence: true, length: { in: 0..4 }
  validates :y_location, presence: true, length: { in: 0..4 }
  validates :f_direction, presence: true
end
