class AddSwapcardJsonToSwapcardAutonomy < ActiveRecord::Migration[5.1]
  def change
    add_column :swapcard_autonomies, :swapcard_json, :jsonb
  end
end
