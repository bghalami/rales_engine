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
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue#index'
      end

      scope module: 'merchants' do
        resources :merchants, only: [:index, :show] do
          get '/items', to: 'items#index'
          get '/invoices', to: 'invoices#index'
          get '/revenue', to: 'revenue#show'
          get '/favorite_customer', to: 'favorite_customer#show'
          get '/customers_with_pending_invoices', to: 'customers_with_pending_invoices#index'
        end
      end

      resources :customers, only: [:index, :show]

    end
  end
end
