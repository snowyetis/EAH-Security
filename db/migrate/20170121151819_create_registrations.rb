class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string :full_name
      t.string  :company
      t.string :email
      t.string  :telephone

      t.timestamps null: false
    end
  end
end
