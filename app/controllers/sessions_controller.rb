class SessionsController < ApplicationController
  def logIn
  end

  def crear
    @usuario = Usuario.find_by(mail: params[:mail])
    if (!!@usuario && @usuario.authenticate(params[:password]))
      session[:usuario_id] = @usuario.id
      redirect_to library_path
    else
      redirect_to :logIn, alert: "No se pudo iniciar sesion"
    end
  end

  def logOut
    session.delete(:usuario_id)
    session[:usuario_id] = nil
    redirect_to library_path
  end
end
