class SubscriptionPayment < ApplicationRecord
    # associations
    belongs_to :subscription

    # validations
    # validates :next_payment_date, presence: true, comparison: { greater_than: self.subscription.start_date }

end
