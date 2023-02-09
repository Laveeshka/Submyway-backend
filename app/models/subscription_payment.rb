class SubscriptionPayment < ApplicationRecord
    # associations
    belongs_to :subscription

    # validations
    # validates :next_payment_date, presence: true, comparison: { greater_than: start_date }

    # def start_date
    #     self.subscription.start_date
    # end
end
