class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :id_usuario
      t.string :id_libro
      t.integer :puntuacion
      t.datetime :fecha
      t.string :comentario

      t.timestamps
    end
  end
end
