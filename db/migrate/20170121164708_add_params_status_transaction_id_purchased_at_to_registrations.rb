class AddParamsStatusTransactionIdPurchasedAtToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :notification_params, :text
    add_column :registrations, :status, :string
    add_column :registrations, :transaction_id, :string
    add_column :registrations, :purchased_at, :datetime
  end
end
