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
     params.permit!
     params.require(:tag)
  end
end
