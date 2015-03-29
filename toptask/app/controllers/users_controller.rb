class UsersController < ApplicationController
	
	#  Cria um novo usuário para ser salvo no banco
	# dados vem da tela.
	def new
		@user = User.new 
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user, notice: 'Cadastro concluído com sucesso'
		else
			render action: :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
        puts "SENHA ATUAL: " + @user[:password] if not @user[:password] == nil 
        puts "SENHA NOVA: " + user_params[:password]
        if @user.update(user_params)
			redirect_to @user, notice: 'Usuário alterado  com sucesso!'
		else
			render action: :edit
		end
	end

 private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :permission)
  end

end