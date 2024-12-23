class CreatePrintButtonClicks < ActiveRecord::Migration[7.1]
  def change
    create_table :print_button_clicks do |t|
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
