class NotificacionesController < ApplicationController
  before_action :public_action

  def view
  end

  def restricted_action
    #aca enlistaria las notificaciones que tenga el usuario.
  end

  def public_action
    unless current_user
      flash.now[:alert] = "Debes iniciar sesión para ver esta página."
    end    
  end
end
