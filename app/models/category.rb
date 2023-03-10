class Category < ApplicationRecord
    #association
    has_many :subscription_categories, dependent: :destroy
    has_many :subscriptions, through: :subscription_categories

    #validation
    validates :title, uniqueness: {case_sensitive: false}, presence: true
end
