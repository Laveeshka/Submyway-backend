class CreateSubscriptionPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_payments do |t|
      t.integer :subscription_id
      t.datetime :next_payment_date

      t.timestamps
    end
  end
end
