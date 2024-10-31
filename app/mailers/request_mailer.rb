class RequestMailer < ApplicationMailer
  def notify_request(request_body)
    @request_body = request_body

    mail(
      to: ENV["MAIL_TO"],
      subject: "New Request Notification"
    ) do |format|
      format.text { render "notify_request" }
    end
  rescue Brevo::ApiError => e
    Rails.logger.error("Failed to send email: #{e.message}")
    # We can set some extra logs here
  end
end
