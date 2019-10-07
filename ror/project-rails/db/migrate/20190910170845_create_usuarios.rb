class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :username, null: false, unique: true
      t.string :nombre, null: false, default: ""
      t.string :apellidos, null: false, default: ""
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
