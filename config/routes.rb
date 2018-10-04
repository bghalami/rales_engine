Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoices', to: "invoices#index"
        get '/:id/transactions', to: "transactions#index"
        get '/:id/favorite_merchant', to: "favorite#show"
      end
      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

      resources :customers, only: [:index, :show]

      resources :merchants, only: [:index, :show]

    end
  end
end
