class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
    # @user = User.find
  end

  def update
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @order = Order.create(user_id: current_user.id)
    @cart.items.each do |item|
      Flow.create(order_id: @order.id, item_id: item.id)
    end

    @cart.items.destroy_all
    redirect_to root_path, :info => "Merci pour votre commande, vous allez bientôt recevoir un email !"

  end
  
  private

  def authenticate_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end


end




# <%= button_to "Supprimer l'article", cart_path(current_user.id), :item_id => item.id, :method => "post" %>   
