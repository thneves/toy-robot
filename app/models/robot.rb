class Robot < ApplicationRecord

  attr_accessor :x_position, :y_position, :f_orientation

  def initialize(params = {})
    @x_position = nil
    @y_position = nil
    @f_orientation = nil
  end
end
