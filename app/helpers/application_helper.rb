module ApplicationHelper

  def display_robot(robot, x, y)
    if robot.nil?
      render 'robots/empty'
    elsif robot.x_location == x && robot.y_location == y
      render 'robots/robot_icon'
    end
  end
end
