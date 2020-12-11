class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.text :about
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
