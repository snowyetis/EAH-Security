class AddProductDetailsToProduct < ActiveRecord::Migration
  def change
    add_reference :product_details, :product, index: true, foreign_key: true
  end
end
