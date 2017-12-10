class CompanyMailer < ApplicationMailer

	default from: "matheusantonio@univem.edu.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_mailer.new_comment.subject
  #
  def new_comment(job, comment)
  	@job = job
  	@comment = comment
  	@company = job.company

    mail to: @company.email, subject: "new commment received"
  end
end
