class Categoria < ApplicationRecord
  # has_many :ingredientes, dependent: :delete_all
  # has_many :ingredientes, dependent: :destroy
  # has_many :ingredientes, dependent: :nullify
  has_many :ingredientes

end
