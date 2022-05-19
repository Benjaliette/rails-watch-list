class Movie < ApplicationRecord
  validates :title, :overview, presence: true
  validates :title, uniqueness: true
  has_many :lists
  has_many :bookmarks
end
