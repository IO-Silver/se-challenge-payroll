class RecordsOfWorkController < ApplicationController
  before_action :set_record_of_work, only: %i[ show update destroy ]

  # GET /records_of_work
  def index
    @records_of_work = RecordOfWork.all

    render json: @records_of_work
  end

  # GET /records_of_work/1
  def show
    render json: @record_of_work
  end

  # POST /records_of_work
  def create
    @record_of_work = RecordOfWork.new(record_of_work_params)

    if @record_of_work.save
      render json: @record_of_work, status: :created, location: @record_of_work
    else
      render json: @record_of_work.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records_of_work/1
  def update
    if @record_of_work.update(record_of_work_params)
      render json: @record_of_work
    else
      render json: @record_of_work.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records_of_work/1
  def destroy
    @record_of_work.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_of_work
      @record_of_work = RecordOfWork.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_of_work_params
      params.require(:record_of_work).permit(:hours)
    end
end
