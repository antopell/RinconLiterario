class CreateNota < ActiveRecord::Migration[7.1]
  def change
    create_table :nota do |t|
      t.string :lectureId
      t.string :note

      t.timestamps
    end
  end
end
