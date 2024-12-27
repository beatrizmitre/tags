class Tag < ApplicationRecord
  attribute :meses_proxima_troca_oleo_motor, default: "6"
  attribute :km_proxima_troca_filtro_oleo, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_filtro_ar_motor, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_filtro_ar_condicionado, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_filtro_oleo_combustivel, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_diferencial, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_oleo_cambio, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_fluido_radiador, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_oleo_freio, default: I18n.t("PRÓXIMA")
  attribute :km_proximo_alinhamento, default: I18n.t("PRÓXIMA")
  attribute :km_proxima_troca_fluido_direcao, default: I18n.t("PRÓXIMA")
  attribute :km_proximo_balanceamento, default: I18n.t("PRÓXIMA")
  def generate_zpl
    ZplGenerator.new.generate_tag_zpl(self)
  end
end
