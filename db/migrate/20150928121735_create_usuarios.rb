class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellidoPaterno
      t.string :apellidoMaterno
      t.string :contrasena
      t.string :correo
      t.string :direccion
      t.boolean :pago

      t.timestamps null: false
    end
    add_index :usuarios, :correo, unique: true
  end
end
