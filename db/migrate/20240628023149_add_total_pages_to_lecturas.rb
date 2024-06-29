class AddTotalPagesToLecturas < ActiveRecord::Migration[7.1]
  def change
    add_column :lecturas, :total_pages, :integer
  end
end
