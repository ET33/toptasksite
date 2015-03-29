class ChangeUserTable < ActiveRecord::Migration
  def change
  	  	remove_column :users, :cliente
  		add_column :users, :cliente, :bit
  end
end