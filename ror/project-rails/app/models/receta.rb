class Receta < ApplicationRecord
  # has_and_belongs_to_many :ingredientes
  has_many :ingredientes_recetas, dependent: :destroy
  has_many :ingredientes, through: :ingredientes_recetas
  belongs_to :usuario

  accepts_nested_attributes_for :ingredientes_recetas
  # https://stackoverflow.com/questions/9174513/rails-has-many-through-form-with-checkboxes-and-extra-field-in-the-join-model
  # https://carlossanchezperez.wordpress.com/2015/01/11/rails-4-como-crear-un-formulario-y-utilizar-accepts_nested_attributes_for-con-has-many-through-relations-algunos-consejos-para-entenderlo-desde-cero/



  scope :publicas, -> {where(publica: true)}
  scope :privadas, -> {where(publica: false)}
  scope :con_usuario, -> {includes(:usuario)}
  scope :con_ingredientes_y_categorias, -> {includes(ingredientes: [:categoria])}
  scope :de_usuario, -> (usuario) {where(usuario: usuario)}


  def inicializar_ingredientes_recetas
    [].tap do |ing_recetas|
      Ingrediente.all.sort_by{|ing| ing.nombre}.each do |ingrediente|
        if ingrediente_receta = ingredientes_recetas.find{|ing_rec| ing_rec.ingrediente_id == ingrediente.id}
          ing_recetas << ingrediente_receta
        else
          ing_recetas << IngredientesReceta.new(ingrediente: ingrediente)
        end
      end
    end
  end

end
