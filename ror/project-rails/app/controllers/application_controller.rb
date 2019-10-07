class ApplicationController < ActionController::Base
  # def new
  #   @nombre = 'Ángel'
  # end

  # def home
  #   render 'home'
  # end
  def is_admin?
    if !current_usuario.admin
      redirect_to ingredientes_path
    end
  end
end
