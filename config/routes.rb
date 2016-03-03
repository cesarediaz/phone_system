Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :phones do
        get 'order_number', on: :collection
        get 'get_list', on: :collection
      end
    end
  end

  resources :cities, only: [:index, :show]
  root 'home#index'
end
