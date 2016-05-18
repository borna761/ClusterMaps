Rails.application.routes.draw do
#  get "activities" => "activities#index"
#  get "activities/new" => "activities#new", as: "new_activity"
#  get "activities/:id/edit" => "activities#edit", as: "edit_activity"
#  get "activities/:id" => "activities#show", as: "activity"
#  post "activities" => "activities#create"
#  patch "activities/:id" => "activities#update"

resources :activities


  root "activities#index"
end
