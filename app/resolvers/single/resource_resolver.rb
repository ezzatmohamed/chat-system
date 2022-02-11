module Single
    class ResourceResolver
        def initialize(resource)
            @resource = resource
        end

        def asJson
            raise NoMethodError, "#{self.class} #asJson is an abstract method and must be implemented by the subclass."
        end
    end
end