Rails.application.routes.draw do
  root :to  => 'lines#index'
  resources :lines
  resources :stations
end
