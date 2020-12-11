class AddProvinceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :province, null: false, foreign_key: true
  end
end
