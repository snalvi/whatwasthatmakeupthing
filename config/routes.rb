Rails.application.routes.draw do
  devise_for :makeup_users, path: '', path_name: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#root'
  get 'makeup', to: 'makeup#index'
  get 'addmakeupitem', to: 'makeup#addmakeupitem'
  post 'addmakeupitem', to: 'makeup#create'
end
