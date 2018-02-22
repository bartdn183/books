Rails.application.routes.draw do
  root 'home#index'

  get 'table_view' => "home#table_view"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
