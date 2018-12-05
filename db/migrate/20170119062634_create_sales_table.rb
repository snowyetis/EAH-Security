class CreateSalesTable < ActiveRecord::Migration[5.0]
  def change

          create_table :sales do |t|
            t.references :quote
            t.decimal :total
            t.decimal :tax
            t.decimal :labor
            t.decimal :parts_cost
            t.datetime :date_sold

    end
  end
end
