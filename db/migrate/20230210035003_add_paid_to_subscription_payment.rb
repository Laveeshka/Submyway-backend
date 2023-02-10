class AddPaidToSubscriptionPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :subscription_payments, :paid, :boolean
  end
end
