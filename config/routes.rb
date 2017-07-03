Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#root'
  get 'makeup', to: 'makeup#index'
  get 'addmakeupitem', to: 'makeup#addmakeupitem'
  post 'addmakeupitem', to: 'makeup#create'
end
