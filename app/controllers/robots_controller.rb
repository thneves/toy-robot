class RobotsController < ApplicationController
  before_action :set_robot, only: %i[ show edit update destroy ]

  # GET /robots or /robots.json
  def index
    @robots = Robot.all
  end

  # GET /robots/1 or /robots/1.json
  def show
  end

  # GET /robots/new
  def new
    @robot = Robot.new
  end

  # GET /robots/1/edit
  def edit
  end

  # POST /robots or /robots.json
  def create
    @robot = Robot.new(robot_params)

    respond_to do |format|
      if @robot.save
        format.html { redirect_to robot_url(@robot), notice: "Robot was successfully created." }
        format.json { render :show, status: :created, location: @robot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robots/1 or /robots/1.json
  def update
    respond_to do |format|
      if @robot.update(robot_params)
        format.html { redirect_to robot_url(@robot), notice: "Robot was successfully updated." }
        format.json { render :show, status: :ok, location: @robot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robots/1 or /robots/1.json
  def destroy
    @robot.destroy

    respond_to do |format|
      format.html { redirect_to robots_url, notice: "Robot was successfully destroyed." }
      format.json { head :no_content }
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
