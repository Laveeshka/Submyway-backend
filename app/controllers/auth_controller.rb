class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :auto_login]
    #used to log in user
    #creates a jwt
    def create
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = encode_token({ user_id: user.id })
            render json: { user: user, jwt: token }, status: :accepted
        else
            render json: { message: "Invalid username or password" }, status: :unauthorized
        end
    end

    #used to auto log in user
    def auto_login
        token = params[:token]
        decoded_token = JWT.decode(token, ENV["JWT_SUPER_SECRET"], true, algorithm: 'HS256')
        user_id = decoded_token[0]["user_id"]
        user = User.find_by(id: user_id)
        render json: { user: user }, status: :ok
    end

    def login_params
        params.permit(:username, :password)
    end

end
