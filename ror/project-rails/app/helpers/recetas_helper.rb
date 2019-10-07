module RecetasHelper
  def is_the_owner? receta
    if current_usuario != receta.usuario
      return false
    end
    return true
  end
  # def is_the_owner? receta_id
  #   if current_usuario != Receta.con_usuario.find(receta_id).usuario
  #     return false
  #   end
  #   return true
  # end

  def emoji_puntuacion puntuacion
    puntuacion < 0 ? '🤢' : '😋'
  end
end
