Rails.application.routes.draw do
  resources :locations do
    resources :machines
  end
  resources :machines do
    resources :products
    resources :inventories
  end
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
