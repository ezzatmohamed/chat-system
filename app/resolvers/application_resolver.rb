class ApplicationResolver < BaseResolver

    def asJson
        # Resolve if it's a single application
        if @resources.instance_of? Application
            resolveSingle(@resources)
        # Resolve if they're multiple applications
        else
            @resources.map do |app|
                resolveSingle(app)
            end
        end

    end

    private

    def resolveSingle(app)
        {
            name: app.name,
            token: app.token,
            chats_count: app.chats_count,
        }
    end
end