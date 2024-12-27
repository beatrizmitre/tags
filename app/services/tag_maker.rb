class TagMaker
  include ActionView::Helpers::NumberHelper
  attr_accessor :nome_cliente, :placa_carro, :telefone, :numero_pedido_bling, :km_atual, :km_proxima_troca, :alinhamento,
  :balanceamento, :diferencial, :f_direcao, :filt_ar_cond, :filt_ar_motor, :filt_comb, :filt_oleo, :fluido_radiador, :oleo_cambio, :oleo_freio, :tipo_cambio, :errors

  def initialize(
    nome_cliente: nil,
    placa_carro: nil,
    telefone: nil,
    numero_pedido_bling: nil,
    km_atual: nil,
    enviar_lembrete_apos: nil,
    km_proxima_troca: nil,
    alinhamento: false,
    balanceamento: false,
    diferencial: false,
    f_direcao: false,
    filt_ar_cond: false,
    filt_ar_motor: false,
    filt_comb: false,
    filt_oleo: false,
    fluido_radiador: false,
    oleo_cambio: false,
    oleo_freio: false,
    tipo_cambio: nil)

    @nome_cliente = nome_cliente
    @placa_carro = placa_carro
    @telefone = telefone
    @numero_pedido_bling = numero_pedido_bling
    @km_atual = km_atual
    @enviar_lembrete_apos = enviar_lembrete_apos
    @km_proxima_troca = km_proxima_troca
    @alinhamento = alinhamento
    @balanceamento = balanceamento
    @diferencial = diferencial
    @f_direcao = f_direcao
    @filt_ar_cond = filt_ar_cond
    @filt_ar_motor = filt_ar_motor
    @filt_comb = filt_comb
    @filt_oleo = filt_oleo
    @fluido_radiador = fluido_radiador
    @oleo_cambio = oleo_cambio
    @oleo_freio = oleo_freio
    @tipo_cambio = tipo_cambio
    @errors = {}
  end

  def km_atual_valido?
    @km_atual.to_i > 0
  end

  def calcular_km_proxima_troca_oleo_motor
    @km_atual.to_i + km_proxima_troca.to_i
  end

  def calcular_km_proxima_troca_filtro_oleo_motor
    @km_atual.to_i + km_proxima_troca.to_i
  end

  def calcular_km_proxima_troca_filt_ar_condicionado
    @km_atual.to_i + 20000
  end

  def calcular_km_proxima_troca_filt_ar_motor
    @km_atual.to_i + 20000
  end

  def calcular_km_proxima_troca_filt_oleo_combustivel
    @km_atual.to_i + 20000
  end

  def calcular_km_proxima_troca_diferencial
    @km_atual.to_i + 40000
  end

  def calcular_km_proxima_troca_oleo_cambio
    if @tipo_cambio == "Manual"
      @km_atual.to_i + 40000
    elsif @tipo_cambio == "Automático"
      @km_atual.to_i + 60000
    end
  end

  def calcular_proxima_troca_fluido_radiador
    @km_atual.to_i + 40000
  end

  def calcular_proxima_troca_fluido_freio
    @km_atual.to_i + 40000
  end

  def calcular_proxima_troca_fluido_direcao
    @km_atual.to_i + 40000
  end

  def preencher_data_lembrete
    unless @enviar_lembrete_apos.blank?
      @enviar_lembrete_apos
    end
  end

  def create_tag
    Tag.create placa_carro: @placa_carro, nome_cliente: @nome_cliente, telefone: @telefone, numero_pedido_bling: @numero_pedido_bling, km_atual: preencher_km_atual, km_proxima_troca_oleo_motor: preencher_km_oleo_motor, meses_proxima_troca_oleo_motor: "6", km_proxima_troca_filtro_oleo: preencher_km_filtro_oleo_motor, km_proxima_troca_filtro_ar_motor: preencher_km_filtro_ar_motor, km_proxima_troca_filtro_ar_condicionado: preencher_km_filtro_ar_condicionado, km_proxima_troca_filtro_oleo_combustivel: preencher_km_filtro_combustivel, km_proxima_troca_diferencial: preencher_km_filtro_diferencial, km_proxima_troca_oleo_cambio: preencher_km_oleo_cambio, km_proxima_troca_fluido_radiador: preencher_km_fluido_radiador, km_proxima_troca_oleo_freio: preencher_km_oleo_freio, km_proxima_troca_fluido_direcao: preencher_km_fluido_direcao, lembrar_cliente_em: preencher_data_lembrete
  end

  def preencher_km_atual
    number_with_delimiter(@km_atual)
  end

  def preencher_km_oleo_motor
    if @km_atual
      number_with_delimiter calcular_km_proxima_troca_oleo_motor
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_filtro_oleo_motor
    if @filt_oleo
      number_with_delimiter calcular_km_proxima_troca_filtro_oleo_motor
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_filtro_ar_motor
    if @filt_ar_motor
      number_with_delimiter calcular_km_proxima_troca_filt_ar_motor
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_filtro_ar_condicionado
    if @filt_ar_cond
      number_with_delimiter calcular_km_proxima_troca_filt_ar_condicionado
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_filtro_combustivel
    if @filt_comb
      number_with_delimiter calcular_km_proxima_troca_filt_oleo_combustivel
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_filtro_diferencial
    if @diferencial
      number_with_delimiter calcular_km_proxima_troca_diferencial
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_fluido_radiador
    if @fluido_radiador
      number_with_delimiter calcular_proxima_troca_fluido_radiador
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_oleo_freio
    if @oleo_freio
      number_with_delimiter calcular_proxima_troca_fluido_freio
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_fluido_direcao
    if @f_direcao
      number_with_delimiter calcular_proxima_troca_fluido_direcao
    else
      I18n.t("PRÓXIMA")
    end
  end

  def preencher_km_oleo_cambio
    if @tipo_cambio == "Manual"
      number_with_delimiter(@km_atual.to_i + 40000)
    elsif  @tipo_cambio == "Automático"
      number_with_delimiter(@km_atual.to_i + 60000)
    end
  end

  def valid?
    @errors.clear
    validar_km_atual
    validar_km_oleo_de_cambio
    @errors.empty?
  end

  def validar_km_atual
    @errors[:km_atual] = I18n.t("Precisa ser um número") if @km_atual.to_i == 0
    @errors[:km_atual] = I18n.t("Não pode ser zero") if @km_atual == "0"
  end

  def validar_km_oleo_de_cambio
    if @oleo_cambio && @tipo_cambio.nil?
      @errors[:tipo_cambio] = I18n.t("Selecione o tipo do câmbio")
    end
  end

end
