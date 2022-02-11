class ApplicationRepo

    def findBy(column_name, value)
        return Application.find_by( column_name => value)
    end

    def fetchAll()
        return Application.all
    end

    def fetchByPage(offset, limit)
        return Application.offset(offset).limit(limit)
    end

    def create(data)
        # generating random unique token
        data[:token] = generate_token
        application = Application.new(
            data.slice(:token, :name)
        )
        return application.save, application
    end

    def update(application_token ,data)
        # generating random unique token
        application = self.findBy('token', application_token)
        if !application
            return false
        end
        
        return application.update(
            data.slice(:name)
        )
    end


    private

    def generate_token
        random_token = nil
        while random_token == nil || Application.exists?(token: random_token) 
        random_token = SecureRandom.uuid
        end
        return random_token
    end
end