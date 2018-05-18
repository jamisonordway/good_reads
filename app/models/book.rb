class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    Book.reviews.average(:rating)
  end
end
