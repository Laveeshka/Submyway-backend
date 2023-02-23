class SubscriptionCategory < ApplicationRecord
    #association
    belongs_to :category
    belongs_to :subscription
end
