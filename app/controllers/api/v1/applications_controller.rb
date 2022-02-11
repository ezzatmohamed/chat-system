module Api
  module V1
    class ApplicationsController < ApplicationController

      def initialize()
        @application_repo = ApplicationRepo.new
      end

      def index 
        # extracting paginatation params
        applications = @application_repo.fetchByPage(offset, limit)
        render json: Multiple::ApplicationsResolver.new(applications).asJson
      end

      def show 
        application = @application_repo.findBy('token', params[:id])
        if application
          render json: Single::ApplicationResolver.new(application).asJson
        else 
          render :nothing =>true, :status => :not_found
        end
      end

      def create
          is_saved, application = @application_repo.create(application_params)
          if is_saved 
            render json: Single::ApplicationResolver.new(application).asJson, status: :created
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

      private 
        
      def application_params
        params.require(:application).permit(:name)
      end

    end
  end
end