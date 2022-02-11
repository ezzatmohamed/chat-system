class ChatResolver < BaseResolver

    def asJson
        # Resolve if it's a single chat
        if @resources.instance_of? Chat
            resolveSingle(@resources)
        # Resolve if they're multiple chats
        else
            @resources.map do |chat|
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