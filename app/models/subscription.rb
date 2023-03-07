class Subscription < ApplicationRecord
    # associations
    belongs_to :company
    belongs_to :user
    has_many :subscription_payments, dependent: :destroy
    has_many :subscription_categories, dependent: :destroy
    has_many :categories, through: :subscription_categories

    # in-built validations
    validates :frequency, presence: true, numericality: true, inclusion: {in: [1]}
    validates :billing, presence: true, inclusion: {in: ["weekly", "monthly", "yearly"]}
    validates :pricing, presence: true, numericality: { greater_than: 0 }

end
