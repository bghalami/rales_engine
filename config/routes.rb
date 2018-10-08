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

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
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

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

      namespace :transactions do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

      scope module: 'transactions' do
        resources :transactions, only: [:index, :show] do
          get '/invoice', to: 'invoice#show'
        end
      end

      scope module: 'items' do
        resources :items, only: [:index, :show] do
          get '/invoice_items', to: 'invoice_items#index'
          get '/merchant', to: 'merchant#show'
          get '/best_day', to: 'best_day#show'
        end
      end

      scope module: 'invoices' do
        resources :invoices, only: [:index, :show] do
          get '/invoice_items', to: 'invoice_items#index'
          get '/transactions', to: 'transactions#index'
          get '/items', to: 'items#index'
          get '/customer', to: 'customer#show'
          get '/merchant', to: 'merchant#show'
        end
      end

      scope module: 'invoice_items' do
        resources :invoice_items, only: [:index, :show] do
          get '/invoice', to: 'invoice#show'
          get '/item', to: 'item#show'
        end
      end

      resources :customers, only: [:index, :show]

    end
  end
end
