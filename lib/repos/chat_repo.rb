class ChatRepo

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
        application = Application.find_by(:token => @application_token)
        latest_chat = Chat.where(application_id: application.id)
            .order("number")
            .last

        number =  latest_chat ? latest_chat.number + 1 : 1

        data = {
            :application_id => application.id,
            :number => number
        }

        chat = Chat.new(data)
        return chat.save, chat
    end
end