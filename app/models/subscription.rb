class Subscription < ApplicationRecord
    # associations
    belongs_to :company
    belongs_to :user
    has_many :subscription_payments, dependent: :destroy

    # in-built validations
    validates :status, presence: true
    validates :frequency, presence: true, numericality: true, inclusion: {in: [1, 2]}
    validates :billing, presence: true, inclusion: {in: ["weekly", "monthly", "yearly"]}
    validates :pricing, presence: true, numericality: { greater_than: 0 }
    #validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Time.new}

end
