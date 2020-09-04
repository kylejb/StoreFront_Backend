module JwtAuth 
    def self.encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.jwt_api[:secret], "HS256", {typ: "JWT"})
    end

    def self.decoded_token(headers)
        if headers
            token = headers.split(' ')[1]
            begin
                JWT.decode(token, Rails.application.credentials.jwt_api[:secret], true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end
end