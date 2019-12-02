Rails.application.routes.draw do
  post "users/create"=>"users#create"
  get "users/signup"=>"users#new"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get 'users/login_form' => 'users#form'
  post 'users/login' => 'users#login'
  post "users/logout"=>"users#logout"

  get '/' => "results#index"
  get 'results/new' => "results#new"
  post "results/create" => "results#create"
  get 'results/:id/edit' => 'results#edit'
  post "results/:id/update" => "results#update"
  post "results/:id/destroy" => "results#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
