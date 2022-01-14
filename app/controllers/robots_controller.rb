class RobotsController < ApplicationController
  def new
    @robot = Robot.new
    @current_robot = Robot.last
  end

  def create
    @robot = Robot.new(robot_params)
    redirect_to root_path if @robot.save
  end

  # rubocop: disable Metrics/CyclomaticComplexity
  def move_robot
    @robot = Robot.last
    case @robot.f_direction
    when 'north'
      (@robot.y_location - 1).negative? ? { notice: 'Cannot move' } : @robot.y_location -= 1
    when 'south'
      @robot.y_location + 1 > 4 ? { notice: 'Cannot move' } : @robot.y_location += 1
    when 'east'
      @robot.x_location + 1 > 4 ? { notice: 'Cannot move' } : @robot.x_location += 1
    when 'west'
      (@robot.x_location - 1).negative? ? { notice: 'Cannot move' } : @robot.x_location -= 1
    end
    @robot.update!(x_location: @robot.x_location, y_location: @robot.y_location, f_direction: @robot.f_direction)
    redirect_to root_path
  end
  # rubocop: enable Metrics/CyclomaticComplexity

  # rubocop: disable Style/GuardClause
  def left
    @robot = Robot.last

    if @robot.f_direction == 'west' || @robot.f_direction == 'east'
      @robot.update!(f_direction: 'north')
      redirect_to root_path and return
    end

    if @robot.f_direction == 'north' || @robot.f_direction == 'south'
      @robot.update!(f_direction: 'west')
      redirect_to root_path and return
    end
  end

  def right
    @robot = Robot.last

    if @robot.f_direction == 'west' || @robot.f_direction == 'east'
      @robot.update!(f_direction: 'south')
      redirect_to root_path and return
    end

    if @robot.f_direction == 'north' || @robot.f_direction == 'south'
      @robot.update!(f_direction: 'east')
      redirect_to root_path and return
    end
  end
  # rubocop: enable Style/GuardClause

  private

  def robot_params
    params.require(:robot).permit(:x_location, :y_location, :f_direction)
  end
end
