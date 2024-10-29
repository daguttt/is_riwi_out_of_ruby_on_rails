class RequestsController < ApplicationController
  def create
    # render json: { message: "Request created" }
    @request = Request.new(request_params)

    is_request_saved = @request.save

    if !is_request_saved
      return render json: @request.errors, status: :unprocessable_entity
    end

    # Notify with a email
    RequestMailer.notify_request(@request.body).deliver_now

    render json: @request, status: :created
  end

  private
    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:body)
    end
end
