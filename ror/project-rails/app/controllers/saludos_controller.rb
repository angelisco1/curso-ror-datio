class SaludosController < ApplicationController

  def saludo_generico

  end

  def saludo_personal
    @nombre = params[:nombre]
  end
end
