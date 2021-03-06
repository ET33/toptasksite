class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :senha
      t.string :cliente
      t.string :funcao
      t.string :equipe
      t.string :foto

      t.index :email, unique: true

      t.timestamps null: false
    end
  end
end
