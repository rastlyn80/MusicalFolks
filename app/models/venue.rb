class Venue < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :venue_type, presence: true
  validates :instruments, presence: true
  validates :max_guests, presence: true
  validates :preferred_style, presence: true
  
  
end
