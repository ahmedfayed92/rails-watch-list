class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  # validates :movie, presence: true, allow_blank: false
  # validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
end
