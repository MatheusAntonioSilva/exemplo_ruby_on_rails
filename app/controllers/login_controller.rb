class LoginController < ApplicationController
	def new
		
	end

	def create
		company = Company.find_by_email(params[:company][:email])

		if company && company.valid_password?(params[:company][:password])
			session[:company_id] = company.id
			redirect_to root_path
		else
			flash.now[:alert] = "Senha e e-mail invalidos!"
			render action: "new"
		end
	end
end