class RequestsController < ApplicationController
  def create
    # render json: { message: "Request created" }
    @request = Request.new(request_params)

    if @request.save
      render json: @request, status: :created
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:body)
    end
end
