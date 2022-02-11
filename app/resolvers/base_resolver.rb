class BaseResolver
    
    def initialize(resources)
        @resources = resources
    end

    def asJson
        raise NoMethodError, "#{self.class} #asJson is an abstract method and must be implemented by the subclass."
    end
end