class User < ApplicationRecord
    #bcrypt macro
    has_secure_password

    #associations
    has_one :profile, dependent: :destroy

    #in-built validation
    validates :username, :email, uniqueness: { case_sensitive: false }
end
