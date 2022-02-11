module Single
    class ApplicationResolver < ResourceResolver
        def asJson
            {
                name: @resource.name,
                token: @resource.token,
                chats_count: @resource.chats_count,
            }
        end
    end
end