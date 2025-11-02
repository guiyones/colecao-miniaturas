class CreateMiniaturas < ActiveRecord::Migration[8.0]
  def change
    create_table :miniaturas do |t|
      t.string :descricao
      t.string :colecao
      t.string :linha
      t.string :marca_carro
      t.string :marca_mini
      t.string :ano

      t.timestamps
    end
  end
end
