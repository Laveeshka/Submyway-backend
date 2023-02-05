class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    #use this controller action for Sign Up
    def create
        new_user = User.create!(user_params)
        render json: {user: new_user}, status: :created
    end

    private
    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end
