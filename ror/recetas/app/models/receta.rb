class Receta < ApplicationRecord
  has_many :ingredientes_recetas
  has_many :ingredientes, through: :ingredientes_recetas


  # No hace falta borrar nada porque el inflections funciona si lo cambiamos al momento
  # has_many :ingredientes_recetum, class_name: :IngredientesReceta
  # has_many :ingredientes, through: :ingredientes_recetum
end
