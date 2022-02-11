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
    application = @application_repo.findBy('token', params[:id])

    if application
      render json: application , except: [:id]
    else 
      render :nothing =>true, :status => :not_found
    end
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


  def update
    params.require(:name)
    
    application = @application_repo.update(
      params[:id],
      name: params[:name]
    )
    if application
      render :nothing => true, :status => :ok
    else
      render :nothing => true, :status => :bad_request
    end
  end

end