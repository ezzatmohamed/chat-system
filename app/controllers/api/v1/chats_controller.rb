module Api
    module V1
        class ChatsController < ApplicationController
            before_action :initialize_repo

            def initialize_repo
                application_token = params[:token]
                application = ApplicationRepo.new.findBy('token', application_token)
                @chat_repo = ChatRepo.new(application)
            end

            def index
                chats = @chat_repo.fetchByPage(offset, limit)
                render json: Multiple::ChatsResolver.new(chats).asJson
            end
            
            def show 
                chat = @chat_repo.findBy('number', params[:id])
                if chat
                    render json: Single::ChatResolver.new(chat).asJson
                else
                    render :nothing => true, :status => :not_found
                end
            end

            def create
                is_saved, chat = @chat_repo.create()
                UpdateChatsCountJob.perform_later(chat.application)
                if is_saved 
                    render json: Single::ChatResolver.new(chat).asJson, status: :created
                else
                    render json: chat.errors, status: :unproccessable_entity
                end
            end
        end
    end
end
