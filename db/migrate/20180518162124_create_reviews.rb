class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :username
      t.text :body
      t.string :rating

      t.timestamps
    end
  end
end
