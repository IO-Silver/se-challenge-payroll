class ReportsController < ApplicationController
  include ProcessWorkReport

  before_action :set_report, only: %i[ show update destroy ]

  # GET /reports
  def index
    @reports = Report.all

    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = Report.create(filename: report_params.original_filename)

    if @report.save
      ProcessWorkReport.process_report(@report, report_params)
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find_by(filename: report_params.original_filename)
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:file)
    end
end
