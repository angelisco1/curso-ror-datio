module UsuariosHelper
  def nombre_completo usuario
    "#{usuario.nombre} #{usuario.apellidos}"
  end
end
