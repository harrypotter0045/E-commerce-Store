class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :model_year
      t.decimal :price

      t.timestamps
    end
  end
end
