class Robot < ApplicationRecord
  validates :x_location, presence: true,
                         numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 4 }
  validates :y_location, presence: true,
                         numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 4 }
  validates :f_direction, presence: true, inclusion: { in: %w[north south west east] }
end
