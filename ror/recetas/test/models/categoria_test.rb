require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Sin nombre en blnaco" do
    cat = Categoria.new(nombre: '')
    assert_not cat.valid?
  end
end
