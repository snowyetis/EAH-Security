class CreateQuestionaireTable < ActiveRecord::Migration[5.0]
  def change
      create_table :questionaires do |t|
        t.references :user, index: true, foreign_key: true
        t.references :quote, index: true, foreign_key: true
        t.string :product_type
        t.text :comments

        t.timestamps null: false
      end
    end
  end
