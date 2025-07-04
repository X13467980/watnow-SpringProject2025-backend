Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resource :sessions, only: [ :create, :destroy ] do
        get :current, on: :collection
      end

      post "signup", to: "users#create"

      post "machines/identify", to: "machines#identify"

      resources :users, only: [ :index, :create, :destroy ]
      resources :machines, only: [ :index, :create, :new ]
      resources :gyms, only: [ :create, :index ]
      resources :gym_machines, only: [ :create, :index ]
      resources :users_trainings, only: [ :create, :index, :show, :update, :destroy ]
      resources :menus, only: [ :create, :index, :show, :update, :destroy ] do
       collection do
        get :grouped_by_part
      end
      end
      resources :users_trainings, only: [ :create, :index ]
    end
  end
end
