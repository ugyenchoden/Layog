class JobApplicationsController < ApplicationController
  def index
    @_job_applications = current_user.job_applications.includes(:company).order(applied_on: :desc)
    render json: @_job_applications.as_json(include: :company)
  end

  def create
    @_job_application = current_user.job_applications.new(job_application_params)
    if @_job_application.save
      render json: @_job_application.as_json(include: :company), status: :created
    else
      render json: { errors: @_job_application.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @_job_application = current_user.job_applications.find(params[:id])
    if @_job_application.update(job_application_params)
      render json: @_job_application.as_json(include: :company)
    else
      render json: { errors: @_job_application.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @_job_application = current_user.job_applications.find(params[:id])
    render json: @_job_application.as_json(include: :company)
  end

  def destroy
    @_job_application = current_user.job_applications.find(params[:id])
    @_job_application.destroy
    head :no_content
  end

  private

  def job_application_params
    params.require(:job_application).permit(:position, :applied_on, :status, :notes, :company_id)
  end
end
