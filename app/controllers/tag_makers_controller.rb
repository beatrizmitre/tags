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
    # Define an array of checkbox fields that should be converted to booleans
    checkbox_fields = %i[
      alinhamento balanceamento diferencial f_direcao filt_ar_cond
      filt_ar_motor filt_comb filt_oleo fluido_radiador oleo_cambio oleo_freio
    ]

    # Permit all parameters and retrieve the `tag_maker` parameters as a hash
    infos = params.require(:tag_maker).permit!.to_hash.symbolize_keys

    # Transform only the checkbox fields
    checkbox_fields.each do |field|
      infos[field] = infos[field] == "1" if infos.key?(field)
    end

    infos[:km_atual] = infos[:km_atual].gsub(/[.]/, '')

    infos
  end
end
