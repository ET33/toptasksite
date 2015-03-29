class AddSecurePassword < ActiveRecord::Migration
  def change
      remove_column :users, :senha
      remove_column :users, :permissao
      remove_column :users, :nome
      add_column :users, :name, :string
      add_column :users, :permission, :integer
      add_column :users, :password, :string
      add_column :users, :password_digest, :string 
  end
end
