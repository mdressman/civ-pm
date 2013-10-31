CivPM::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :projects do
    resources :milestones do 
      resources :checkpoints do
        collection do
          post :complete
        end
      end
      resources :assets do
        collection do
          post :receive
        end
      end
    end
  end


  
  root 'projects#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/timeline', to: 'static_pages#timeline', via: 'get'

end
