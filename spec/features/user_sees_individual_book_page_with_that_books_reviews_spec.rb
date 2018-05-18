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
      review = book.reviews.create(username: 'Jamison', body: 'This book is pretty fun', rating: '4')

      visit book_path(book)
      expect(page).to have_content(book.title)
      expect(page).to have_content(review.username)
      expect(page).to have_content(review.body)
      expect(page).to have_content(review.rating)
    end
  end
end
