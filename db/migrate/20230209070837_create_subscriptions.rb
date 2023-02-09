class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :company_id
      t.boolean :status
      t.integer :frequency
      t.string :billing
      t.float :pricing
      t.datetime :start_date

      t.timestamps
    end
  end
end
