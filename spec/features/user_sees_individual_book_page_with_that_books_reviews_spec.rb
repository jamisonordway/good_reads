require 'rails_helper'

describe 'User' do
  describe 'user navigates to a specific book show page' do
    it 'should show book information' do
    book = Book.create(title: 'Farenheit 451')

    visit book_path(book)
    expect(page).to have_content(book.title)
    end 
  end
end
