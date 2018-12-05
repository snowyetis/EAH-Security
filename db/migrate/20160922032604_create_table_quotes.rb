class CreateTableQuotes < ActiveRecord::Migration[5.0]
  def change
              create_table :quotes do |t|
                t.string :quote_type
                t.references :user
                t.boolean :approved
                t.boolean :pending
                t.boolean :rejected

                t.timestamps null: false
            end
        end
      end
