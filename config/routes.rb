Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/:id/invoices', to: "invoices#index"
        get '/:id/transactions', to: "transactions#index"
      end

      resources :customers, only: [:index, :show]

    end
  end
end
