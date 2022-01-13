class Robot < ApplicationRecord

  validates :x_location, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 4 }
  validates :y_location, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 4 }
  validates :f_direction, presence: true, inclusion: { in: %w(north south west east )}


  def move_message
    puts 'Cannot move outside the table!'
  end

  def move
    case @f_direction
    when 'north'
      (@y_location - 1).negative? ? move_message : @y_location -= 1
    when 'south'
      @y_location + 1 > 4 ? move_message : @y_location += 1
    when 'east'
      @x_location + 1 > 4 ? move_message : @x_location += 1
    when 'west'
      (@x_location - 1).negative? ? move_message : @x_location -= 1
    end
  end
end
