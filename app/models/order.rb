class Order < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :products

  validates :total, presence: true,
    numericality: { greater_then_or_equal_to: 0 }

  # validates :quantity, presence: true,
  #   numericality: { only_integer: true, greater_then: 0 }

  validates :client_id, presence:true
  validates :user_id, presence:true
  validates :product_id, presence:true
end
