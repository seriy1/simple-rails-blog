Rails.application.routes.draw do
  get '/' => 'home#index'
  get '/terms' => 'pages#terms'
  get '/about' => 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :contacts, only: [:new, :create], path_names: { :new => ''}
  resources :articles do
    resource :comments, only: [:create]
  end

end
