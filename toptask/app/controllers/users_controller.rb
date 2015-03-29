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
		@dados = user_params;
		if @dados[:senha] == "" or @dados[:senha] == nil or @user.senha == @dados[:senha]
			@dados[:senha] = @user[:senha]
			@dados[:senha_confirmation] = @user[:senha]
			puts "Senha : " + @user[:senha];
		end
		if @user.update(@dados)
			redirect_to @user, notice: 'Usuário alterado  com sucesso!'
		else
			render action: :edit
		end
	end

 private

  def user_params
    params.require(:user).permit(:nome, :email, :senha, :senha_confirmation, :permissao)
  end

end