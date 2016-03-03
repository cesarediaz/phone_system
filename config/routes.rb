Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :phones do
        get 'order_number', on: :member
        get 'get_list', on: :collection
      end
    end
  end

  get 'home/cities' => 'home#cities'
  root 'home#index'
end
