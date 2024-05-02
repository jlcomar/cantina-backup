class Sale < ApplicationRecord
  belongs_to :customer

  validates :customer_id, presence: true
  validates :cart, presence: true
  validates :total_price, presence: true
end
