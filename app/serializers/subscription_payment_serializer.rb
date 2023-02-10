class SubscriptionPaymentSerializer < ActiveModel::Serializer
  attributes :id, :paid, :next_payment_date
end
