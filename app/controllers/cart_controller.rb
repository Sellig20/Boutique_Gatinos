class CartController < ApplicationController
  before_action :authenticate_user

  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])

    @cart.bills.find_by(params[:item_id]).destroy

  private

  def authenticate_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end


end




# <%= button_to "Supprimer l'article", cart_path(current_user.id), :item_id => item.id, :method => "post" %>   
