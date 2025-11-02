require "application_system_test_case"

class MiniaturasTest < ApplicationSystemTestCase
  setup do
    @miniatura = miniaturas(:one)
  end

  test "visiting the index" do
    visit miniaturas_url
    assert_selector "h1", text: "Miniaturas"
  end

  test "should create miniatura" do
    visit miniaturas_url
    click_on "New miniatura"

    fill_in "Ano", with: @miniatura.ano
    fill_in "Colecao", with: @miniatura.colecao
    fill_in "Descricao", with: @miniatura.descricao
    fill_in "Linha", with: @miniatura.linha
    fill_in "Marca carro", with: @miniatura.marca_carro
    fill_in "Marca mini", with: @miniatura.marca_mini
    click_on "Create Miniatura"

    assert_text "Miniatura was successfully created"
    click_on "Back"
  end

  test "should update Miniatura" do
    visit miniatura_url(@miniatura)
    click_on "Edit this miniatura", match: :first

    fill_in "Ano", with: @miniatura.ano
    fill_in "Colecao", with: @miniatura.colecao
    fill_in "Descricao", with: @miniatura.descricao
    fill_in "Linha", with: @miniatura.linha
    fill_in "Marca carro", with: @miniatura.marca_carro
    fill_in "Marca mini", with: @miniatura.marca_mini
    click_on "Update Miniatura"

    assert_text "Miniatura was successfully updated"
    click_on "Back"
  end

  test "should destroy Miniatura" do
    visit miniatura_url(@miniatura)
    accept_confirm { click_on "Destroy this miniatura", match: :first }

    assert_text "Miniatura was successfully destroyed"
  end
end
