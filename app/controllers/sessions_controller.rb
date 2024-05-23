class SessionsController < ApplicationController
  def logIn
  end

  def crear
    @usuario = Usuario.find_by(mail: params[:mail])
    if (!!@usuario && @usuario.authenticate(params[:password]))
      session[:usario_id] = @usuario.id
      redirect_to root_path, notice: "Se inicio sesion correctamente"
    else
      redirect_to :logIn, alert: "No se pudo iniciar sesion"
    end
  end
end
