class ChatsController < ApplicationController
    require_relative '../../lib/repos/chat_repo'
    before_action :initialize_repo

    def initialize_repo
        application_token = params[:token]
        @chat_repo = ChatRepo.new(application_token)
    end

    def index
        # extracting paginatation params
        per_page = params[:per_page] ? params[:per_page].to_i : 10
        page = params[:page] ? params[:page].to_i : 1

        chats = @chat_repo.fetchByPage(page, per_page)
        render json: chats, except: [:id, :application_id]
    end
    
    def show 
        chat = @chat_repo.findBy('number', params[:id])
        if chat
            render json: chat, except: [:id, :application_id]
        else
            render :nothing => true, :status => :not_found
        end
    end

    def create
        is_saved, chat = @chat_repo.create()
        if is_saved 
            render json: chat, except: [:id, :application_id]
        else
            render json: chat.errors, status: :unproccessable_entity
        end
    end
end
