class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :placa_carro
      t.string :nome_cliente
      t.string :nome_mecanico
      t.string :telefone
      t.string :km_atual
      t.string :oleo_utilizado
      t.string :km_proxima_troca_oleo_motor
      t.string :meses_proxima_troca_oleo_motor
      t.string :km_proxima_troca_filtro_oleo
      t.string :km_proxima_troca_filtro_ar_motor
      t.string :km_proxima_troca_filtro_ar_condicionado
      t.string :km_proxima_troca_filtro_oleo_combustivel
      t.string :km_proxima_troca_diferencial
      t.string :km_proxima_troca_oleo_cambio
      t.string :km_proxima_troca_fluido_radiador
      t.string :km_proxima_troca_oleo_freio
      t.string :km_proximo_alinhamento
      t.string :km_proximo_rodizio
      t.string :km_proximo_balanceamento

      t.timestamps
    end
  end
end
