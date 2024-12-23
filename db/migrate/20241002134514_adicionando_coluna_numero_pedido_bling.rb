class AdicionandoColunaNumeroPedidoBling < ActiveRecord::Migration[7.1]
  def change
    add_column :tags, :numero_pedido_bling, :string
  end
end
