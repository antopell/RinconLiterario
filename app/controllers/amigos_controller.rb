class AmigosController < ApplicationController
  before_action :public_action

  def view
    
  end

  def restricted_action
    #aca enlistaria los amigos que tenga el usuario o le diria que no ha añadido amigos aun
  end

  def public_action
    unless current_user
      flash.now[:alert] = "Debes iniciar sesión para ver esta página."
    end    
  end
end
