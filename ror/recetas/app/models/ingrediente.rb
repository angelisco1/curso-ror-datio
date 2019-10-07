class Ingrediente < ApplicationRecord
  validates_presence_of :nombre
  validates_uniqueness_of :nombre
  # validate :nombre, presence: true
  # validate :nombre, unique: true

  belongs_to :categoria
  has_many :ingredientes_recetas
  has_many :recetas, through: :ingredientes_recetas

  scope :con_categorias, -> { includes(:categoria) }
  scope :join_categorias, -> { joins(:categoria) }

end
