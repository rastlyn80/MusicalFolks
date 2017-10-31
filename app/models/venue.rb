class Venue < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :venue_type, presence: true
  validates :instruments, presence: true
  validates :max_guests, presence: true
  validates :preferred_style, presence: true
  
  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
end
