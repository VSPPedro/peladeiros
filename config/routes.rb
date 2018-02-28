Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :attendance_lists, :users
end
