class ApplicationController < ActionController::API
    before_action :require_jwt

    def require_jwt
        token = request.headers['HTTP_AUTHORIZATION']
        if !token || !valid_token(token)
            head :unauthorized
        end
    end

    private
    def valid_token(token)
        if token
            token.gsub!('Bearer ', '')
            begin
                decoded_token = JWT.decode token, Rails.application.credentials[:secret_jwt], true
                return true
            rescue JWT::DecodeError => e
                Rails.logger.warn "Error decoding the JWT: " + e.to_s
            end
        end
        false
    end
end
