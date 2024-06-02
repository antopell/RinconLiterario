class AddBookImgToLecturas < ActiveRecord::Migration[7.1]
  def change
    add_column :lecturas, :book_img, :string
  end
end
