module Multiple
    class MessagesResolver < ResourcesResolver
        def asJson
            @resources.map do |message|
                Single::MessageResolver.new(message).asJson
            end
        end
    end
end