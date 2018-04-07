ActiveAdmin.register Product do
	permit_params :name, :photo, :price, :category_id, :inventory_id, :top
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  column :name
  column :photo do |product|
     image_tag product.photo.thumb
   end

  column :category
  column :top
  column :price
  actions
end
form do |f|
    f.inputs "productos" do
      f.input :name
      f.input :price
      f.input :category, as: :select, collection: Category.all, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click' }
      f.input :photo, :as => :file
      f.input :top

    end
    f.actions
  end
  
end

