class Order < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :items, dependent: :destroy, inverse_of: :order
  has_many :products, through: :items

  validates :total, presence: true,
    numericality: { greater_then_or_equal_to: 0 }

  # validates :quantity, presence: true,
  #   numericality: { only_integer: true, greater_then: 0 }

  validates :client_id, presence:true
  validates :user_id, presence:true
  # validates :product_id, presence:true

  accepts_nested_attributes_for :items, allow_destroy: true #, reject_if: proc { |att| att['product_id'].blank? }
  # accepts_nested_attributes_for :products, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }
end
