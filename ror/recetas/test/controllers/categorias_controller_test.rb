require 'test_helper'

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categorias_index_url
    assert_response :success
  end

end
