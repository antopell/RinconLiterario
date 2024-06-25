class CreateAmistades < ActiveRecord::Migration[6.0]
  def change
    create_table :amistades do |t|
      t.integer :usuario_id, null: false
      t.integer :amigo_id, null: false
      t.string :estado

      t.timestamps
    end

    add_index :amistades, :usuario_id
    add_index :amistades, :amigo_id
    add_index :amistades, [:usuario_id, :amigo_id], unique: true
  end
end
