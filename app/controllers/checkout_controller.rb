class CheckoutController < ApplicationController

  # after_action :delete, only: :success

	def create
    @total = params[:total].to_d
    puts @total
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    puts @session
    respond_to do |format|
      format.js {}# renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)


    @cart = Cart.find_by(user_id: current_user.id)
    @order = Order.create(user_id: current_user.id)
    @cart.items.each do |item|
      Flow.create(order_id: @order.id, item_id: item.id)
    end

    @cart.items.destroy_all
    redirect_to root_path, :info => "Merci pour votre commande, vous allez bientôt recevoir un email !"

  end

  def cancel
  end

# private
#   def delete
#      redirect_to: cart_path(@cart.id), :method =>:delete 
#   end

end