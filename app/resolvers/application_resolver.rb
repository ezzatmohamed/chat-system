class ApplicationResolver
    def initialize(applications)
        @applications = applications
    end

    def asJson
        # Resolve if applications is an object
        if @applications.instance_of? Application
            resolveSingle(@applications)
        # Resolve if they're multiple applications
        else
            @applications.map do |app|
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

    attr_reader :applications
end