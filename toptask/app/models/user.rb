class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :name, :permission
	validates_numericality_of :permission, {:only_integer => true ,message: " inválida!"}
	validates_uniqueness_of :email
	validates_format_of :email, with: EMAIL_REGEXP
    
    has_secure_password
    
end
