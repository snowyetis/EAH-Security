class Product < ApplicationRecord
  belongs_to :quote, optional: true
  has_many :product_details

  accepts_nested_attributes_for :product_details, :allow_destroy => true
end
