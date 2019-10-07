class Receta < ApplicationRecord
  # has_and_belongs_to_many :ingredientes
  has_many :ingredientes_recetas, dependent: :destroy
  has_many :ingredientes, through: :ingredientes_recetas
  belongs_to :usuario

  accepts_nested_attributes_for :ingredientes_recetas
  # https://stackoverflow.com/questions/9174513/rails-has-many-through-form-with-checkboxes-and-extra-field-in-the-join-model
  # https://carlossanchezperez.wordpress.com/2015/01/11/rails-4-como-crear-un-formulario-y-utilizar-accepts_nested_attributes_for-con-has-many-through-relations-algunos-consejos-para-entenderlo-desde-cero/


  # TODO: ESTE ES IMPORTANTE, DE AQUI SAQUE LA SOLUCION: https://stackoverflow.com/questions/9174513/rails-has-many-through-form-with-checkboxes-and-extra-field-in-the-join-model
  def initialized_ingredientes_recetas
    [].tap do |ing_rec|
      Ingrediente.all.sort_by{|i| i.nombre}.each do |ingrediente|
        if i = ingredientes_recetas.find{|ir| ir.ingrediente_id == ingrediente.id}
          ing_rec << i.tap {|ir| ir.pertenece ||= true}
        else
          ing_rec << IngredientesReceta.new(ingrediente: ingrediente)
        end
      end
    end
  end

end
