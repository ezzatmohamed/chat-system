class ApplicationsController < ApplicationController
  require_relative '../../lib/repos/application_repo'

  def initialize()
    @application_repo = ApplicationRepo.new
  end

  def index 
    # extracting paginatation params
    per_page = params[:per_page] ? params[:per_page].to_i : 10
    page = params[:page] ? params[:page].to_i : 1
    applications = @application_repo.fetchByPage(page, per_page)
    render json: applications
  end

  def show 
    render json: @application_repo.findBy('token', params[:id]), except: [:id]
  end

  def create
      params.require(:name)
      is_saved, application = @application_repo.create(
        name: params[:name],
      )
      if is_saved 
        render json: application, except: [:id]
      else
        render json: application.errors, status: :unproccessable_entity
      end
  end

end
