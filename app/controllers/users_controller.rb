class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        new_user = User.create!(user_params)
        render json: new_user, status: :created
    end

    private
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

end
