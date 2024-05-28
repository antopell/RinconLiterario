class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :mail
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
