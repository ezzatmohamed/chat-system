class MessageRepo
    
    def initialize(chat)
        @chat = chat
    end

    def findBy(column_name, value)
        return Message.find_by(
                chat: @chat,
                column_name => value
            )
    end

    def fetchAll()
        return Message.where(chat: chat).all
    end

    def fetchByPage(offset, limit)
        return Message.where(chat: @chat)
            .offset(offset)
            .limit(limit)
    end

    def getMessagesCount
        Message.where(:chat => @chat).count
    end

    def create(data)
        latest_message = getLatestMessageForChat()
        number =  latest_message ? latest_message.number + 1 : 1

        data = data.merge({
            :chat => @chat,
            :number => number
        })
        
        message = Message.new(
            data.slice(:content, :chat, :number)
        )
        return message.save, message
    end

    def update(message_number ,data)
        message = self.findBy('number', message_number)
        if !message
            return false
        end
        return message.update(
            data.slice(:content)
        )
    end

    def search(query)
        Message.where(chat: @chat)
            .search(query)
            .records
    end
    
    def getLatestMessageForChat()
        Message.where(chat: @chat)
            .order("number")
            .last
    end
end