class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      add_reference :usuarios, :usuario, foreign_key: true
      t.string :id_libro
      t.integer :puntuacion
      t.datetime :fecha
      t.string :comentario

      t.timestamps
    end
  end
end
