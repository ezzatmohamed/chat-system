module Single
    class MessageResolver < ResourceResolver
        def asJson
            {
                number: @resource.number,
                content: @resource.content,
            }
        end
    end
end