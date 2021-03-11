class BillsController < ApplicationController
  def create
    @bill = Bill.new(cart_id: current_user.cart.id, item_id: params[:item_id])

    if @bill.save == true
      respond_to do |format|
        format.html {redirect_to root_path, :succes => "Ajouté au panier !"}
        format.js { }
      end
    else
      redirect_to root_path, :warning => "Erreur !"
    end
  end

  def destroy
    @bill = Bill.where(cart_id: current_user.cart.id, item_id: params[:id])
    @stock = params[:id]
    @bill.destroy_all
    @total = sum(current_user)

    respond_to do |format|
      format.html { redirect_to cart_path(current_user.cart.id) }
      format.js {}
    end
  end

  private

  def sum (user)
    result = 0
    user.cart.items.each do |item|
      result = result + item.price
    end
    return result
  end
end

