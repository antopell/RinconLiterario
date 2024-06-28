class AddFieldsToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :apellido, :string
    add_column :usuarios, :descripcion, :text
    add_column :usuarios, :email, :string
  end
end
