class AdicionandoColunaFluidoDirecao < ActiveRecord::Migration[7.1]
  def change
    add_column :tags, :km_proxima_troca_fluido_direcao, :string
  end
end
