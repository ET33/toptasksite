class ChangeTypePermissaoFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :permissao
  	add_column :users, :permissao, :integer
  end
end
