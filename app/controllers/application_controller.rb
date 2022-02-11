class ApplicationController < ActionController::API
    MAX_LIMIT = 100
    DEFAULT_LIMIT = 10
    DEFAULT_OFFSET = 0

    def limit
        [
            params.fetch(:limit, DEFAULT_LIMIT).to_i,
            MAX_LIMIT
        ].min
    end

    def offset
        params.fetch(:offset, DEFAULT_OFFSET)
    end
end
