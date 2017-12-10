class CompaniesController < ApplicationController

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company].permit(:name, :email, :password))

		if @company.save
			redirect_to root_path, notice: "Company salvado com sucesso"
		else
			render action: "new"
		end
	end
end