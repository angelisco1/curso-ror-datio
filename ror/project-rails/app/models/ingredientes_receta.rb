class IngredientesReceta < ApplicationRecord
  belongs_to :ingrediente
  belongs_to :receta

  def self.actualizar_ingredientes_recetas antiguos_ingredientes_recetas
    ingredientes_recetas_actualizar = antiguos_ingredientes_recetas.inject({}) do |acc, i|
      acc[i[:id]] = {cantidad: i[:cantidad]}
      acc
    end
    IngredientesReceta.update(ingredientes_recetas_actualizar.keys, ingredientes_recetas_actualizar.values) ? true : false
  end

  def self.crear_ingredientes_recetas receta, nuevos_ingredientes_recetas
    ingredientes_recetas = nuevos_ingredientes_recetas.map do |ing_rec|
      ing_rec[:receta_id] = receta.id
      ing_rec
    end
    IngredientesReceta.create(ingredientes_recetas) ? true : false
  end

  def self.eliminar_ingredientes_recetas ingredientes_recetas_ids
    # puts "ELIMINAR: #{ingredientes_recetas_ids}"
    IngredientesReceta.destroy(ingredientes_recetas_ids) ? true : false
  end
end
