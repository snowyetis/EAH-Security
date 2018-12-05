class AddProductReferenceToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_reference :registrations, :product, index: true
  end
end
