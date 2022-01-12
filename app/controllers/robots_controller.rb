class RobotsController < ApplicationController
  def index
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new
    render :new
  end
end
