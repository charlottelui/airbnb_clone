class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
  has_one_attached :photo
end
