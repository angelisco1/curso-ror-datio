class IngredientesReceta < ApplicationRecord
  belongs_to :ingrediente
  belongs_to :receta
end
