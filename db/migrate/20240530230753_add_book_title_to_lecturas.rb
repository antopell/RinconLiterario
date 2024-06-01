class AddBookTitleToLecturas < ActiveRecord::Migration[7.1]
  def change
    add_column :lecturas, :book_title, :string
  end
end
