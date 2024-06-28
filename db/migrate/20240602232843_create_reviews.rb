class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :libro_id
      t.integer :puntuacion
      t.datetime :fecha
      t.string :comentario

      t.timestamps
    end
  end
end
