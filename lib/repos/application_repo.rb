class ApplicationRepo
    def find(id)
        return Application.find(id)
    end

    def findBy(column_name, value)
        return Application.find_by( column_name => value)
    end

    def fetchAll()
        return Application.all
    end

    def fetchByPage(page, per_page)
        offset = ((page-1) * per_page) + 1
        return Application.offset(offset).limit(per_page)
    end

    def create(data)
        # generating random unique token
        data[:token] = generate_token
        application = Application.new(
            data.slice(:token, :name)
        )
        return application.save, application
    end


    protected

    def generate_token
        random_token = nil
        while random_token == nil || Application.exists?(token: random_token) 
        random_token = SecureRandom.urlsafe_base64(100)
        end
        return random_token
    end
end