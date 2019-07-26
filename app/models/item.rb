class Item < ApplicationRecord
  has_many :products
  belongs_to :order, inverse_of: :items, optional: true


  accepts_nested_attributes_for :products, allow_destroy: true, reject_if: proc { |attr| attr["ordered_product_quantity"].blank? }
end
