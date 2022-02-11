class ChatRepo
    def initialize(application)
        @application = application
    end

    def findBy(column_name, value)
        return Chat.find_by(
                application: @application,
                column_name => value
            )
    end

    def fetchAll()
        return Chat.where(
            application: @application,
            token: @application_token
        ).all
    end

    def fetchByPage(offset, limit)
        return Chat.where(application: @application)
            .offset(offset)
            .limit(limit)
    end

    def getChatsCount
        Chat.where(:application => @application).count
    end
    
    def create()
        latest_chat = getLatestChatForApp()
        number =  latest_chat ? latest_chat.number + 1 : 1

        chat = Chat.new(
            application: @application,
            :number => number
        )
        return chat.save, chat
    end

    def getLatestChatForApp()
        Chat.where(application: @application)
            .order("number")
            .last
    end

    def self.getChatByNumberAndAppToken(number, token)
        return Chat.joins(:application)
            .find_by(
                :application => {
                    token: token
                },
                number: number
            )
    end
end