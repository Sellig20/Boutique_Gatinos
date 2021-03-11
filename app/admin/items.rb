ActiveAdmin.register Item do
permit_params :title, :description, :price, :image_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :price, :image_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
