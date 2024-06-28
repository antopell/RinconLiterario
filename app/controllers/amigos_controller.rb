class AmigosController < ApplicationController
  before_action :require_user, only: [ :create, :update, :destroy] # Asegura que el usuario esté autenticado para estas acciones
  before_action :set_usuario, only: [:view]


  def view
    if current_user
      #@amigos = current_user.amigos + current_user.inverse_amigos
      @amigos = current_user.amigos
      if @amigos.empty?
        flash.now[:alert] = "No tienes amigos añadidos."
      end
    else
      flash[:alert] = "Debes iniciar sesión para ver esta página."
    end
  end

  def create
    @amigo = Usuario.find(params[:amigo_id])
    @amistad = current_user.amistades.build(amigo: @amigo, estado: 'pendiente')

    if @amistad.save
      flash[:notice] = "Solicitud de amistad enviada."
      redirect_to profile_path(@amigo)
    else
      flash[:alert] = "No se pudo enviar la solicitud de amistad."
      redirect_to usuarios_path
    end
  end

  def update
    @amistad = Amistad.find(params[:id])
    if @amistad.update(estado: params[:estado])
      flash[:notice] = "Solicitud de amistad actualizada."
      redirect_to profile_path(current_user)
    else
      flash[:alert] = "No se pudo actualizar la solicitud de amistad."
      redirect_to profile_path(current_user)
    end
  end

  def destroy
    @amistad = Amistad.find(params[:id])
    @amistad.destroy
    flash[:notice] = "Amistad eliminada."
    redirect_to profile_path(current_user)
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id]) if params[:id]
  end
end
