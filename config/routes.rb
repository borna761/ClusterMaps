Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
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
  get '/activities/cluster/:cluster' => 'activities#index'

  get "/clusters" => "clusters#index"
  post "/clusters" => "clusters#new"

  post "/cluster_users" => "cluster_users#create"
  patch "/cluster_users" => "cluster_users#update"
  delete "/cluster_users" => "cluster_users#delete"

  root "activities#index"
end
