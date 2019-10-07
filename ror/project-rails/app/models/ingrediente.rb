class Ingrediente < ApplicationRecord
  belongs_to :categoria
  # has_and_belongs_to_many :recetas
  has_many :ingredientes_recetas, dependent: :destroy
  has_many :recetas, through: :ingredientes_recetas

  def get_name
    self[:nombre]
  end

  def self.cambiar_categoria ingredientes_ids, nueva_categoria_id
    Ingrediente.where(:id => ingredientes_ids).update_all(:categoria_id => nueva_categoria_id)
  end
end
