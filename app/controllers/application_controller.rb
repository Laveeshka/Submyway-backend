class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

    #behold Rails magic
    before_action :authorized

    #creates a JWT with a secret
    def encode_token(payload)
        JWT.encode(payload, ENV["JWT_SUPER_SECRET"] )
    end

    #below functions check for an authorized user and lock the API to prevent unauthorized access

    #check if an incoming request has an Authorization header
    #usually, the request headers will have { Authorization: 'Bearer <token> } as a key-value pair
    def auth_header
        request.headers['Authorization']
    end

    #if there is an authorization header,
    # 1) grab the token from the header
    # 2) decode the token and return decoded token
    def decode_token
        if auth_header
            #we want the token only, so we grab the string at index 1 ("Bearer" string resides at index 0 after effecting split on auth_header)
            token = auth_header.split(" ")[1]
            #let's begin decoding
            begin
               JWT.decode(token, ENV["JWT_SUPER_SECRET"], true, algorithm: 'HS256') 
               #rescue out of an arising exception if the server receives a bad token
            rescue JWT::DecodeError
                nil
            end
        end
    end

    #if we have a successfully decoded token, let's find the current user
    def current_user
        if decode_token
            # 1) grab the <user_id> stored in the token
            # 2) find that user, Taken style
            user_id = decoded_token[0]['user_id']
            user = User.find_by(id: user_id)
        end
    end

    #check if user is logged in
    #current_user should be truthy
    def logged_in?
        !!current_user
    end


    #be nice and send a Not Authorized message in the response for an unauthorized user
    #that is, if the user is not logged in
    def authorized
        render json: { message: "We like to know a face. Please log in"}, status: :unauthorized unless logged_in?
    end


    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end
    
    def render_record_not_found_response(exception)
        render json: { error: "#{exception.model} not found" }, status: :not_found
    end

end
