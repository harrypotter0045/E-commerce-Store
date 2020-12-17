class CheckoutController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    if order.nil?
      redirect_to root_path
      nil
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items:           [{
        name:     "Total Price",
        amount:   (order.total_price * 100).to_i,
        currency: "cad",
        quantity: 1
      }],
      success_url:          checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}" + "&order_id=#{order.id}",
      cancel_url:           checkout_cancel_url
    )

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    if @payment_intent["status"] == "succeeded"
      order = Order.find(params[:order_id])
      order.update(status: "paid", stripe_id: @payment_intent["id"])
    end
  end

  def cancel; end
end
