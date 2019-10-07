class Categoria < ApplicationRecord
  validates_presence_of :nombre#, message: 'ssdasdasdas'
  has_many :ingredientes
end
