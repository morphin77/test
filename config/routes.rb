Rails.application.routes.draw do
  post 'set_user_action_permission', to: 'api#set_user_action_permission'
  post 'set_role_action_permission', to: 'api#set_role_action_permission'
  post 'set_user_resource_permission', to: 'api#set_user_resource_permission'
  post 'set_role_resource_permission', to: 'api#set_role_resource_permission'
  #post 'api/set_resource_permission'
  # resources :resource_permissions
  # resources :resources
  # resources :action_permissions
  # resources :actions
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
