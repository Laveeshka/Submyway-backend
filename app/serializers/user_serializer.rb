class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_one :profile
  has_many :subscriptions
end
