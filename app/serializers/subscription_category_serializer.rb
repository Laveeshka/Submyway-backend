class SubscriptionCategorySerializer < ActiveModel::Serializer
  attributes :id, :subscription_id, :category_id
  belongs_to :category
end
