class QuoteDetailsRenameEximateToEstimate < ActiveRecord::Migration[5.0]
  def change
    rename_column :quote_details, :eximate, :estimate
  end
end
