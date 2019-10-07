class UsuariosController < ApplicationController
  before_action :authenticate_usuario!

  def perfil
    @usuario = current_usuario
  end

end
