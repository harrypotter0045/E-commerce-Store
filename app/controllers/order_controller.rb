class OrderController < ApplicationController
  include Devise::Controllers::Helpers
  def create
    @current_cus = current_customer
    @products = Product.find(session[:cart])
    total = 0
    @products.each do |product|
      total += product.price
    end
    @province = Province.find_by(id: @current_cus.province_id)
    gst = total * @province.gst.to_d
    pst = total * @province.pst.to_d
    total += (total * @province.tax_rate)
    @order = Order.create(status: "new", customer_id: @current_cus.id, total_price: total, pst: pst, gst: gst)
    @products.each do |product|
      OrderItem.create(order_id: @order.id, product_id: product.id)
    end

    session.delete("cart")
  end
end
