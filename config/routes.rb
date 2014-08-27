Rails.application.routes.draw do
  resources :activity,:events,:notifications,:users

  post 'activity/updateuser' => 'activity#update_user'

  post 'activity/get_events' => 'activity#get_events'
  post 'activity/checkin_event' => 'activity#checkin_event'
  post  'activity/get_allevents' => 'activity#get_all_events'
  get  'notifications' => 'notifications#index'
  get  'users' => 'users#index'
  get  'logout' => 'events#logout'
  root 'events#index'


end
