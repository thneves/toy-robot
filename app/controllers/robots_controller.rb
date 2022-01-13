class RobotsController < ApplicationController
  before_action :set_robot, only: %i[ show edit update destroy ]

  # GET /robots or /robots.json
  def index
    @robots = Robot.all
  end

  # GET /robots/1 or /robots/1.json
  def show
  end

  def move_robot
    @robot = Robot.last
    case @robot.f_direction
    when 'north'
      (@robot.y_location - 1).negative? ? {notice: "Cannot move"} : @robot.y_location -= 1
    when 'south'
      @robot.y_location + 1 > 4 ? {notice: "Cannot move"} : @robot.y_location += 1
    when 'east'
      @robot.x_location + 1 > 4 ? {notice: "Cannot move"} : @robot.x_location += 1
    when 'west'
      (@robot.x_location - 1).negative? ? {notice: "Cannot move"} : @robot.x_location -= 1
    end
    @robot.update(x_location: @robot.x_location, y_location: @robot.y_location, f_direction: @robot.f_direction)
    @current_robot = @robot
    redirect_to root_path
  end

  def left
    return @f_orientation = 'west' if @f_orientation == 'north' || @f_orientation == 'south'
    return @f_orientation = 'north' if @f_orientation == 'west' || @f_orientation == 'east'
  end

  def right
    return @f_orientation = 'east' if @f_orientation == 'north' || @f_orientation == 'south'
    return @f_orientation = 'south' if @f_orientation == 'west' || @f_orientation == 'east'
  end

  # GET /robots/new
  def new
    @robot = Robot.new
    @current_robot = Robot.last
  end

  # POST /robots or /robots.json
  def create
    @robot = Robot.new(robot_params)
    if @robot.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot
      @robot = Robot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def robot_params
      params.require(:robot).permit(:x_location, :y_location, :f_direction)
    end
end
