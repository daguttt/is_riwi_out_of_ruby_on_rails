class RequestMailer < ApplicationMailer
  def notify_request(request_body)
    @request_body = request_body
    mail(to: ENV["MAIL_TO"], subject: "New Request Received")
  end
end
