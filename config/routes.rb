Rails.application.routes.draw do
  root 'home#index'
  get 'home/cities' => 'home#cities'
end
