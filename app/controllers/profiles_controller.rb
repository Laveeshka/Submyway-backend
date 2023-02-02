class ProfilesController < ApplicationController
    
    def index
        profile = current_user.profile
        render json: profile, status: :ok
    end

end
