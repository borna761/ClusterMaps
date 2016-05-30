Rails.application.routes.draw do
  resources :cluster_users
  devise_for :users
#  get "activities" => "activities#index"
#  get "activities/new" => "activities#new", as: "new_activity"
#  get "activities/:id/edit" => "activities#edit", as: "edit_activity"
#  get "activities/:id" => "activities#show", as: "activity"
#  post "activities" => "activities#create"
#  patch "activities/:id" => "activities#update"

resources :activities do
  collection do
    get 'stats'
  end
end

get "clusters" => "clusters#index"
post "clusters" => "clusters#new"

  root "activities#index"
end
