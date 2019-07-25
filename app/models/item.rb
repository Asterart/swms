class Item < ApplicationRecord
  has_many :products
  belongs_to :order, inverse_of: :items, optional: true


  accepts_nested_attributes_for :products, allow_destroy: true#, reject_if: proc { |att| att['product_id'].blank? }
end
