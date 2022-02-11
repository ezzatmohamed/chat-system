module Multiple
    class ApplicationsResolver < ResourcesResolver
        def asJson
            @resources.map do |app|
                Single::ApplicationResolver.new(app).asJson
            end
        end
    end
end