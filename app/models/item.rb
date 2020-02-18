class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
  belongs_to :user
  has_one :booking
  has_many_attached :photos
end
