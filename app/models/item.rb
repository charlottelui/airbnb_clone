class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
  belongs_to :user
  has_one :booking, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: {
      title: 'A',
      description: 'B'
   },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
