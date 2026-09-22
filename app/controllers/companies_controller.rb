class CompaniesController < ApplicationController
  def index
    @_companies = Company.all
    render json: @_companies
  end

  def create
    @_company = Company.new(company_params)
    if @_company.save
      render json: @_company, status: :created
    else
      render json: { errors: @_company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
