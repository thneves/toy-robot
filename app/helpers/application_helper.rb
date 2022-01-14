module ApplicationHelper
  def display_robot(robot, x_l, y_l)
    if robot.nil?
      render 'robots/empty'
    elsif robot.x_location == x_l && robot.y_location == y_l
      render 'robots/robot_icon'
    end
  end
end
