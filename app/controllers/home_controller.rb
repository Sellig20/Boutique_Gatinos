class HomeController < ApplicationController
  def index
  	@item = Item.all
  end
end
