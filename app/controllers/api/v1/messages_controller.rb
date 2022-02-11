module Api
    module V1
        class MessagesController < ApplicationController
            before_action :initialize_repo

            def initialize_repo
                chat = ChatRepo.getChatByNumberAndAppToken(params[:chat_number], params[:token])
                @message_repo = MessageRepo.new(chat)
            end

            def index
                messages = @message_repo.fetchByPage(offset, limit)
                render json: Multiple::MessagesResolver.new(messages).asJson
            end
            
            def show 
                message = @message_repo.findBy('number', params[:id])
                if message
                    render json: Single::MessageResolver.new(message).asJson
                else
                    render :nothing => true, :status => :not_found
                end
            end

            def create
                is_saved, message = @message_repo.create(message_params)
                UpdateMessagesCountJob.perform_later(message.chat)
                if is_saved 
                    render json: Single::MessageResolver.new(message).asJson, status: :created
                else
                    render json: message.errors, status: :unproccessable_entity
                end
            end

            def update
                message = @message_repo.update(
                    params[:id],
                    message_params
                )
                if message
                    render :nothing => true, :status => :ok
                else
                    render :nothing => true, :status => :bad_request
                end
            end

            # TODO: Elastic Search
            def search

            end


            private 
                
            def message_params
                params.require(:message).permit(:content)
            end

        end
    end
end
