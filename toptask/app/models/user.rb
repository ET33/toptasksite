class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :nome, :senha, :senha_confirmation, :permissao
	validates_confirmation_of :senha
	validates_length_of :senha, :minimum => 5
	validates_numericality_of :permissao, {:only_integer => true ,message: " inválida!"}
	validates_uniqueness_of :email
	
	validate do 
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end
