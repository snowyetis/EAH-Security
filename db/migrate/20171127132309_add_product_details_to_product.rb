class AddProductDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_details, :product, index: true, foreign_key: true
  end
end
