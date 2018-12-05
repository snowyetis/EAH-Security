class AddProductToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :quotes, :product, index: true
  end
end
