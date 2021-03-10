class BillController < ApplicationController
  def create
    @bill = Bill.new(cart_id: current_user.cart_id, item_id: params[:item_id])

    if @bill.save == true
      redirect_to root_path, :succes => "Ajouté au panier !"
    else
      redirect_to root_path, :warning => "Erreur !"
    end
  end

  def destroy
    @bill = Bill.find_by_user_id_and_item_id(current_user.id, params[:id])
    @bill.destroy
  end
end

<%= button_to "Supprimer l'article", bill_path(item.id), "data-method" :delete %>
