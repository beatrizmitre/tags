class AddDataLembreteTrocaToTags < ActiveRecord::Migration[7.1]
  def change
    add_column :tags, :lembrar_cliente_em, :string
  end
end
