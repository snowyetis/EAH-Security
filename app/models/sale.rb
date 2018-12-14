class Sale < ApplicationRecord
  has_many :quotes

  :total
  :tax
  :labor
  :parts_cost
  :date_sold
end
