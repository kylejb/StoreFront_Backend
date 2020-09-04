class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JwtAuth::encode_token(payload)
    end
     
    def decoded_token(headers = request.headers['Authorization'])
        JwtAuth::decoded_token(headers)
    end
     
    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end
    
    def logged_in?
        !!current_user
    end
    
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless self.logged_in?
    end
end
