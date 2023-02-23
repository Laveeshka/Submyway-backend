class Company < ApplicationRecord
    # associations
    has_many :subscriptions, dependent: :destroy
    has_many :users, through: :subscriptions

    # in-built validation
    validates :name, uniqueness: { case_sensitive: false }, presence: true

end
