class ChatRepo
    require_relative 'application_repo'
    
    def initialize(application_token)
        @application_token = application_token
    end

    def findBy(column_name, value)
        return Chat
            .joins(:application)
            .find_by(
                :application => {
                    :token => @application_token
                },
                column_name => value
            )
    end

    def fetchAll()
        return Chat.joins(:application).where(
            :application => {:token => @application_token},
            token: @application_token
        ).all
    end

    def fetchByPage(page, per_page)
        offset = ((page-1) * per_page) + 1
        return Chat.joins(:application)
            .where(
                :application => {
                    :token => @application_token
                }
            )
    end

    def create()
        application_repo = ApplicationRepo.new
        application = application_repo.findBy('token', @application_token)

        latest_chat = getLatestChatForApp(application)
        number =  latest_chat ? latest_chat.number + 1 : 1

        chat = Chat.new(
            :application => application,
            :number => number
        )
        return chat.save, chat
    end

    def getLatestChatForApp(application)
        Chat.where(application: application)
            .order("number")
            .last
    end
end