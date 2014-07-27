Rails.application.routes.draw do
  resources :activity

  post 'activity/updateuser' => 'activity#update_user'



end
