require "test_helper"

class MiniaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @miniatura = miniaturas(:one)
  end

  test "should get index" do
    get miniaturas_url
    assert_response :success
  end

  test "should get new" do
    get new_miniatura_url
    assert_response :success
  end

  test "should create miniatura" do
    assert_difference("Miniatura.count") do
      post miniaturas_url, params: { miniatura: { ano: @miniatura.ano, colecao: @miniatura.colecao, descricao: @miniatura.descricao, linha: @miniatura.linha, marca_carro: @miniatura.marca_carro, marca_mini: @miniatura.marca_mini } }
    end

    assert_redirected_to miniatura_url(Miniatura.last)
  end

  test "should show miniatura" do
    get miniatura_url(@miniatura)
    assert_response :success
  end

  test "should get edit" do
    get edit_miniatura_url(@miniatura)
    assert_response :success
  end

  test "should update miniatura" do
    patch miniatura_url(@miniatura), params: { miniatura: { ano: @miniatura.ano, colecao: @miniatura.colecao, descricao: @miniatura.descricao, linha: @miniatura.linha, marca_carro: @miniatura.marca_carro, marca_mini: @miniatura.marca_mini } }
    assert_redirected_to miniatura_url(@miniatura)
  end

  test "should destroy miniatura" do
    assert_difference("Miniatura.count", -1) do
      delete miniatura_url(@miniatura)
    end

    assert_redirected_to miniaturas_url
  end
end
