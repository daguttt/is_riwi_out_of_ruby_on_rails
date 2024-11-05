class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params.merge(status: :PENDING))

    is_report_saved = @report.save

    if !is_report_saved
      return render problem: { errors: @report.errors }, status: :unprocessable_entity
    end

    render json: @report, status: :created
  end

  private

  def report_params
    params.require(:report).permit(:type)
  end
end
