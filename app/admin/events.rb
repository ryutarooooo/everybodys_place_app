ActiveAdmin.register Event do
  permit_params :user_id, :name, :prefecture, :place, :title, :content, :count, :price, :image, :start_time, :end_time
end
