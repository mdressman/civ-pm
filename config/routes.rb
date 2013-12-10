CivPM::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :clients do
    resources :projects do 
      resources :milestones do
        collection do
          post :complete
        end
      end
      resources :assets do
        collection do
          post :receive
        end
      end
      resources :deliverables do
        collection do
          post :complete
        end
      end
    end
  end


  
  root 'clients#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/calendar', to: 'static_pages#calendar', via: 'get'

end
