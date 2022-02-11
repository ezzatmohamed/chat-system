class ApplicationController < ActionController::API
    def limit
        [
            params.fetch(:limit, 10).to_i,
            100
        ].min
    end

    def offset
        params.fetch(:offset, 0)
    end
end
