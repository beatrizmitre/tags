class ZplGenerator

  def create_label_zpl(width = 600, height = 600, print_speed = 3)
    Zebra::Zpl::Label.new(width: width, height: height, print_speed: print_speed)
  end

  def create_text_zpl(text, x_position, y_position)
      Zebra::Zpl::Text.new(
        data: text,
        position: [x_position, y_position],
        font_size: Zebra::Zpl::FontSize::SIZE_2,
      )
  end

  def create_date_text_zpl(text)
    create_text_zpl(text , 150, 40)
  end

  def create_km_atual_text_zpl(text)
    create_text_zpl("COM " + text.to_s + " KM" , 100, 65)
  end

  def create_nome_mecanico_text_zpl(text)
    create_text_zpl(" T: " + text.to_s, 260, 65)
  end

  def create_oleo_utilizado_text_zpl(text)
    create_text_zpl("ÓLEO " + text.to_s , 40, 90)
  end

  def create_proxima_troca_text_zpl
    create_text_zpl("PRÓXIMA TROCA", 165, 115)
  end

  def create_km_proxima_troca_oleo_motor_text_zpl(text)
    create_text_zpl("ÓLEO MOTOR " + text.to_s + " KM OU " , 30, 140)
  end

  def create_meses_proxima_troca_oleo_motor_text_zpl(text)
    create_text_zpl(text.to_s + " meses", 320, 140)
  end

  def create_km_proxima_troca_filtro_oleo_text_zpl(text)
    create_text_zpl("FILT ÓLEO " + text.to_s, 45, 165)
  end

  def create_km_proxima_troca_filtro_ar_motor_text_zpl(text)
    create_text_zpl("FILT AR MOTOR " + text.to_s, 295, 165)
  end

  def create_km_proxima_troca_filtro_ar_condicionado_text_zpl(text)
    create_text_zpl("FILT AR COND " + text.to_s, 75, 190)
  end

  def create_km_proxima_troca_filtro_oleo_combustivel_text_zpl(text)
    create_text_zpl("FILT COMB " + text.to_s, 370, 190)
  end

  def create_km_proxima_troca_diferencial_text_zpl(text)
    create_text_zpl("DIFERENCIAL " + text.to_s, 100, 215)
  end

  def create_km_proxima_troca_oleo_cambio_text_zpl(text)
    create_text_zpl("ÓLEO CAMBIO " + text.to_s, 350, 215)
  end

  def create_km_proxima_troca_fluido_radiador_text_zpl(text)
    create_text_zpl("FLUIDO RADIADOR " + text.to_s, 115, 240)
  end

  def create_km_proxima_troca_oleo_freio_text_zpl(text)
    create_text_zpl("ÓLEO FREIO " + text.to_s, 405, 240)
  end

  def create_km_proximo_alinhamento_text_zpl(text)
    create_text_zpl("ALINHAMENTO " + text.to_s, 140, 265)
  end

  def create_km_proxima_troca_fluido_direcao(text)
    create_text_zpl("F.DIREÇÃO " + text.to_s, 400, 265)
  end

  def create_km_proximo_balanceamento_text_zpl(text)
    create_text_zpl("BALANCEAMENTO " + text.to_s, 205, 289)
  end

  def generate_tag_zpl(tag)
    label = create_label_zpl
    date = create_date_text_zpl("#{tag.created_at.day}/#{tag.created_at.month}/#{tag.created_at.year}")
    nome_mecanico_zpl = create_nome_mecanico_text_zpl(tag.nome_mecanico)
    oleo_utilizado_zpl = create_oleo_utilizado_text_zpl(tag.oleo_utilizado)
    km_atual_zpl = create_km_atual_text_zpl(tag.km_atual)
    km_troca_oleo_motor_zpl = create_km_proxima_troca_oleo_motor_text_zpl(tag.km_proxima_troca_oleo_motor)
    meses_troca_oleo_motor_zpl = create_meses_proxima_troca_oleo_motor_text_zpl(tag.meses_proxima_troca_oleo_motor)
    km_troca_filtro_oleo_zpl = create_km_proxima_troca_filtro_oleo_text_zpl(tag.km_proxima_troca_filtro_oleo)
    km_troca_filtro_ar_motor_zpl = create_km_proxima_troca_filtro_ar_motor_text_zpl(tag.km_proxima_troca_filtro_ar_motor)
    km_troca_filtro_ar_condicionado_zpl = create_km_proxima_troca_filtro_ar_condicionado_text_zpl(tag.km_proxima_troca_filtro_ar_condicionado)
    km_troca_filtro_oleo_combustivel_zpl = create_km_proxima_troca_filtro_oleo_combustivel_text_zpl(tag.km_proxima_troca_filtro_oleo_combustivel)
    km_troca_diferencial_zpl = create_km_proxima_troca_diferencial_text_zpl(tag.km_proxima_troca_diferencial)
    km_troca_oleo_cambio_zpl = create_km_proxima_troca_oleo_cambio_text_zpl(tag.km_proxima_troca_oleo_cambio)
    km_troca_fluido_radiador_zpl = create_km_proxima_troca_fluido_radiador_text_zpl(tag.km_proxima_troca_fluido_radiador)
    km_troca_oleo_freio_zpl = create_km_proxima_troca_oleo_freio_text_zpl(tag.km_proxima_troca_oleo_freio)
    km_alinhamento_zpl = create_km_proximo_alinhamento_text_zpl(tag.km_proximo_alinhamento)
    km_balanceamento_zpl = create_km_proximo_balanceamento_text_zpl(tag.km_proximo_balanceamento)
    km_fluido_direcao_zpl = create_km_proxima_troca_fluido_direcao(tag.km_proxima_troca_fluido_direcao)


    informacoes_etiqueta_em_zpl = [date, nome_mecanico_zpl, oleo_utilizado_zpl, km_atual_zpl, create_proxima_troca_text_zpl, km_troca_oleo_motor_zpl, meses_troca_oleo_motor_zpl, km_troca_filtro_oleo_zpl, km_troca_filtro_ar_motor_zpl, km_troca_filtro_ar_condicionado_zpl, km_troca_filtro_oleo_combustivel_zpl, km_troca_diferencial_zpl, km_troca_oleo_cambio_zpl, km_troca_fluido_radiador_zpl, km_troca_oleo_freio_zpl ,km_alinhamento_zpl, km_fluido_direcao_zpl, km_balanceamento_zpl]
    informacoes_etiqueta_em_zpl.each do |info|
      label << info
    end
    a = ""
    label.dump_contents a
  end
end
