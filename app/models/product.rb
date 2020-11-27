class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :model_year, numericality: { greater_than: 2010, only_integer: true }
  validates :price, numericality: {greater_than_or_equal_to: 0}
  has_one_attached :product_image
end
