class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def parameter_missing(exception)
    render problem: { detail: exception.message }, status: :bad_request
  end
end
