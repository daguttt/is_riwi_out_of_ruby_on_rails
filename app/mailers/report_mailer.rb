class ReportMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.notify_report.subject
  #
  def notify_report(type)
    @report_type = type

    mail to: ENV.fetch("MAIL_TO"), subjet: "New Report Received"
  end
end
