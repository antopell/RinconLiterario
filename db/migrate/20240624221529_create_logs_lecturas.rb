class CreateLogsLecturas < ActiveRecord::Migration[7.1]
  def change
    create_table :logs_lecturas do |t|
      t.string :username
      t.string :lecture_id
      t.integer :last_read_page

      t.timestamps
    end
  end
end
