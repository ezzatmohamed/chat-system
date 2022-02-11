module Multiple
    class ChatsResolver < ResourcesResolver
        def asJson
            @resources.map do |chat|
                Single::ChatResolver.new(chat).asJson
            end
        end
    end
end