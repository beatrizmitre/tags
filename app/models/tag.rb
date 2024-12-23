class Tag < ApplicationRecord
  attribute :meses_proxima_troca_oleo_motor, default: "6"
  attribute :km_proxima_troca_filtro_oleo, default: "PRÓXIMA"
  attribute :km_proxima_troca_filtro_ar_motor, default: "PRÓXIMA"
  attribute :km_proxima_troca_filtro_ar_condicionado, default: "PRÓXIMA"
  attribute :km_proxima_troca_filtro_oleo_combustivel, default: "PRÓXIMA"
  attribute :km_proxima_troca_diferencial, default: "PRÓXIMA"
  attribute :km_proxima_troca_oleo_cambio, default: "PRÓXIMA"
  attribute :km_proxima_troca_fluido_radiador, default: "PRÓXIMA"
  attribute :km_proxima_troca_oleo_freio, default: "PRÓXIMA"
  attribute :km_proximo_alinhamento, default: "PRÓXIMA"
  attribute :km_proxima_troca_fluido_direcao, default: "PRÓXIMA"
  attribute :km_proximo_balanceamento, default: "PRÓXIMA"
  def generate_zpl
    ZplGenerator.new.generate_tag_zpl(self)
  end
end
