class RobotsController < ApplicationController
  def index
  end

  def new
    @robot = Robot.new
  end

  def show
    @robot = Robot.find(params[:id])
  end

  def create
    @robot = Robot.new(robot_params)
  end

  private

  def robot_params
    params.require(:robot).permit(:x_location, :y_location, :f_orientation)
  end
end
