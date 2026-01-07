class TagsController < ApplicationController


  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Etiqueta salva com sucesso!"
      redirect_to @tag
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Etiqueta salva com sucesso!"
      redirect_to tag_path(@tag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(
      :placa_carro, :nome_cliente, :nome_mecanico, :telefone, :km_atual,
      :oleo_utilizado, :km_proxima_troca_oleo_motor, :meses_proxima_troca_oleo_motor,
      :km_proxima_troca_filtro_oleo, :km_proxima_troca_filtro_ar_motor,
      :km_proxima_troca_filtro_ar_condicionado, :km_proxima_troca_filtro_oleo_combustivel,
      :km_proxima_troca_diferencial, :km_proxima_troca_oleo_cambio,
      :km_proxima_troca_fluido_radiador, :km_proxima_troca_oleo_freio,
      :km_proximo_alinhamento, :km_proximo_balanceamento,
      :km_proxima_troca_fluido_direcao, :numero_pedido_bling, :lembrar_cliente_em
    )
  end
end
