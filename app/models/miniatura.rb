class Miniatura < ApplicationRecord
  scope :por_marca_carro, ->(marca_carro) { where(marca_carro: marca_carro) if marca_carro.present? }
end
