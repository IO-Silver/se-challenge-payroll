class JobGroupsController < ApplicationController
  before_action :set_job_group, only: %i[ show update destroy ]

  # GET /job_groups
  def index
    @job_groups = JobGroup.all

    render json: @job_groups
  end

  # GET /job_groups/1
  def show
    render json: @job_group
  end

  # POST /job_groups
  def create
    @job_group = JobGroup.new(job_group_params)

    if @job_group.save
      render json: @job_group, status: :created, location: @job_group
    else
      render json: @job_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_groups/1
  def update
    if @job_group.update(job_group_params)
      render json: @job_group
    else
      render json: @job_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_groups/1
  def destroy
    @job_group.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_group
      @job_group = JobGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_group_params
      params.require(:job_group).permit(:rate)
    end
end
