class AddGstAndPstToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :pst, :decimal
    add_column :orders, :gst, :decimal
  end
end
