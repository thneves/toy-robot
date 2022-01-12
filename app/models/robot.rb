class Robot < ApplicationRecord

  validates :x_location, presence: true, length: { in: 0..4 }
  validates :y_location, presence: true, length: { in: 0..4 }
  validates :f_orientation, presence: true, inclusion: { in: %w(north south east west) }
end
