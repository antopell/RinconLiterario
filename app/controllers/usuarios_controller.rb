class UsuariosController < ApplicationController
  def signIn
    @usuario = Usuario.new
  end

  def crear
    usuario = Usuario.new(usuario_params)
    if (usuario.save)
      session[:usuario_id] = @usuario.id
      redirect_to library_path
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
