class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_type

      t.timestamps null: false
    end
  end
end
