module ApplicationHelper

  def display_robot(robot, x, y)
    if robot.nil?
      render 'robots/empty'
    elsif robot.x_location == x && robot.y_location == y
      render 'robots/robot_icon'
    end
  end

  def move_message
    puts 'Cannot move outside the table!'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def move(orientation, x, y)
    case orientation
    when 'north'
      (y - 1).negative? ? move_message : y -= 1
    when 'south'
      y + 1 > 4 ? move_message : y += 1
    when 'east'
      x + 1 > 4 ? move_message : x += 1
    when 'west'
      (x - 1).negative? ? move_message : x -= 1
    end
  end

end
