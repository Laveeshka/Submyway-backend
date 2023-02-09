class ProfilesController < ApplicationController

    def index
        profile = current_user.profile
        render json: {profile: profile}, status: :ok
    end

end
