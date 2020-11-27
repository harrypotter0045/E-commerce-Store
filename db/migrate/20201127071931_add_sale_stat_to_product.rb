class AddSaleStatToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sale_stat, :boolean
  end
end
