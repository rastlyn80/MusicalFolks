class Venue < ApplicationRecord
  belongs_to :user

  validates :type, presence: true
  validates :listing_name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  
end
