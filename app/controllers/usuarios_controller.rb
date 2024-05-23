class UsuariosController < ApplicationController
  def logIn
  end

  def signIn
    @usuario = Usuario.new
  end

  def crear
    usuario = Usuario.new(usuario_params)
    if (usuario.save)
      redirect_to root_path, notice: "Usuario creado correctamente"
      # render json: usuario, status: :created;
    else 
      redirect_to :signIn, alert: "El usuario no se pudo crear"
      # render json: {errors: usuario.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  
  def usuario_params
    params.require(:usuario).permit(:username, :mail, :password)
  end

end
