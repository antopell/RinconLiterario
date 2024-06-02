class CreateLecturas < ActiveRecord::Migration[7.1]
  def change
    create_table :lecturas do |t|
      t.string :username
      t.string :book_id
      t.string :lecture_state
      t.date :reading_start_date
      t.date :reading_end_date

      t.timestamps
    end
  end
end
