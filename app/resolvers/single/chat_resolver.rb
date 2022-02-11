module Single
    class ChatResolver < ResourceResolver
        def asJson
            {
                number: @resource.number,
                messages_count: @resource.messages_count,
            }
        end
    end
end