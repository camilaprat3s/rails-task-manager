Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get '/tasks', to: 'tasks#index'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'

  # Additional route for /ask
  get '/ask', to: 'your_controller#your_action'

  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  mount ActionCable.server => '/cable'
end
