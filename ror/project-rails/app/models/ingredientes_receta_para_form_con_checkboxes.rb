class IngredientesReceta < ApplicationRecord
  belongs_to :ingrediente
  belongs_to :receta

  # NECESARIO PARA QUE SEA UN PARAMETRO PERMITIDO EN LOS STRONG_PARAMS DE RECETAS_CONTROLLER
  attr_accessor :pertenece
end
