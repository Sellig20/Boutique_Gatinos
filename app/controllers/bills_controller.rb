class BillsController < ApplicationController
  def create
    @bill = Bill.new(cart_id: current_user.cart.id, item_id: params[:item_id])

    if @bill.save == true
      redirect_to root_path, :succes => "Ajouté au panier !"
    else
      redirect_to root_path, :warning => "Erreur !"
    end
  end

  def destroy
    @bill = Bill.where(cart_id: current_user.cart.id, item_id: params[:id])
    @bill.destroy_all
    redirect_to cart_path(current_user.cart.id), :succes => "Ajouté au panier !"
  end
end

