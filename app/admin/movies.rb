ActiveAdmin.register Movie do
  permit_params :title, :url, :content, :category
end
