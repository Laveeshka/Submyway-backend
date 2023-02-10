class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :status, :frequency, :billing, :pricing, :start_date
  has_many :subscription_payments
  has_one :company
end
