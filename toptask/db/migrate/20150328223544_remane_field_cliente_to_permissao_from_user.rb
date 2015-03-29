class RemaneFieldClienteToPermissaoFromUser < ActiveRecord::Migration
  def up
  	rename_column :users, :cliente, :permissao
  end
end
