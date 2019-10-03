class Ingrediente < ApplicationRecord
  validates_presence_of :nombre
  validates_uniqueness_of :nombre
  # validate :nombre, presence: true
  # validate :nombre, unique: true
end
