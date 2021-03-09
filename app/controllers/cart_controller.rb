class CartController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])

    @cart.bills.find_by(params[:item_id]).destroy
end


# <%= button_to "Supprimer l'article", cart_path(current_user.id), :item_id => item.id, :method => "post" %>   
