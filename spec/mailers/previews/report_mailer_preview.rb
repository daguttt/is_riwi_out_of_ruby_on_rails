# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/report_mailer/notify_report
  def notify_report
    ReportMailer.notify_report("COFFEE")
  end
end
