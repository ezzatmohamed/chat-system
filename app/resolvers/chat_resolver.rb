class ChatResolver
    def initialize(chats)
        @chats = chats
    end

    def asJson
        # Resolve if it's a single chat
        if @chats.instance_of? Chat
            resolveSingle(@chats)
        # Resolve if they're multiple chats
        else
            @chats.map do |chat|
                resolveSingle(chat)
            end
        end

    end

    private

    def resolveSingle(chat)
        {
            number: chat.number,
            messages_count: chat.messages_count,
        }
    end
end