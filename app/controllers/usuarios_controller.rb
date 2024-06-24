class UsuariosController < ApplicationController
  before_action :require_user, only: [:edit_user, :update, :profile]
  before_action :set_usuario, only: [:edit_user, :update, :profile]
  
  def signIn
    @usuario = Usuario.new
  end

  def crear
    @usuario = Usuario.new(usuario_params)
    if (@usuario.save)
      session[:usuario_id] = @usuario.id
      redirect_to library_path
      # render json: usuario, status: :created;
    else 
      redirect_to :signIn, alert: "El usuario no se pudo crear"
      # render json: {errors: usuario.errors.full_messages}, status: :unprocessable_entity
    end
  end

  
  def update
    if @usuario.update(usuario_params)
      redirect_to profile_path, notice: "Perfil actualizado correctamente"
    else
      render :edit_user,alert: "El usuario no se editar"
    end
  end

  def profile
    @lecturas = @usuario.lecturas.order(reading_end_date: :desc).limit(3) # Los últimos 3 libros leídos
    
  end
  
  
  def search
    if params[:query].present?
      @usuarios = Usuario.where("username LIKE ?", "%#{params[:query]}%")
    else
      @usuarios = [] 
    end
    render :search_us
  end
  private

  def set_usuario
    #@usuario = Usuario.find(session[:usuario_id])
    #@usuario = current_user
    if params[:id].present?
      @usuario = Usuario.find(params[:id])
    else
      @usuario = current_user
    end
  end

  def usuario_params
    params.require(:usuario).permit(:username, :mail, :password, :nombre, :apellido, :descripcion, :email)
  end

  def usuario_update_params
    update_params = params.require(:usuario).permit(:username, :mail, :nombre, :apellido, :descripcion, :email)
    update_params[:password] = params[:usuario][:password] unless params[:usuario][:password].blank?
    update_params
  end
end