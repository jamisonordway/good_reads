require 'rails_helper'

describe 'User' do
  describe 'user navigates to a specific book show page' do
    it 'should show book information' do
    book = Book.create(title: 'Farenheit 451')

    visit book_path(book)
    expect(page).to have_content(book.title)
    end
    it 'should show reviews associated with that book' do
      book = Book.create(title: 'The Hobbit')
      review = book.reviews.create(username: 'Jamison', body: 'This book is pretty fun', rating: '4', book_id: book.id)

      visit book_path(book)
      expect(page).to have_content(book.title)
      expect(page).to have_content(review.username)
      expect(page).to have_content(review.body)
      expect(page).to have_content(review.rating)
    end
    it 'should show the average rating for that book' do
      book = Book.create(title: 'Harry Potter')
      review_1 = book.reviews.create(username: 'Tyler', body: 'it is pretty good', rating: '3', book_id: book.id)
      review_2 = book.reviews.create(username: 'Cole', body: 'Love it', rating: '5', book_id: book.id)
      visit book_path(book)

      expect(page).to have_content(book.average_rating)
    end
  end
end
