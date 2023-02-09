class User < ApplicationRecord
    #bcrypt macro
    has_secure_password

    #associations
    has_one :profile, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
    has_many :companies, through: :subscriptions

    #in-built validation
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :password, :password_confirmation, presence: true
end
