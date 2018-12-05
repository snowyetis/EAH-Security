class AddReferenceRequesterTypeIdToQuote < ActiveRecord::Migration[5.0]
  def change
    add_reference :quotes, :requester_type, index: true, foreign_key: true
  end
end
