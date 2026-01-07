class TagMakersController < ApplicationController
  def new
    @tag_maker = TagMaker.new
  end

  def create
    @tag_maker = TagMaker.new(**tag_maker_params)
    if @tag_maker.valid?
      @tag = @tag_maker.create_tag
      redirect_to edit_tag_path(@tag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def tag_maker_params
    checkbox_fields = %i[
      alinhamento balanceamento diferencial f_direcao filt_ar_cond
      filt_ar_motor filt_comb filt_oleo fluido_radiador oleo_cambio oleo_freio
    ]

    permitted_params = params.require(:tag_maker).permit(
      :nome_cliente, :placa_carro, :telefone, :numero_pedido_bling,
      :km_atual, :enviar_lembrete_apos, :km_proxima_troca, :tipo_cambio,
      *checkbox_fields
    )

    infos = permitted_params.to_hash.symbolize_keys

    checkbox_fields.each do |field|
      infos[field] = infos[field] == "1" if infos.key?(field)
    end

    infos[:km_atual] = infos[:km_atual].gsub(/[.]/, '')

    infos
  end
end
