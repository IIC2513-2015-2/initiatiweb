Rails.application.routes.draw do

  localesRegexp = /#{I18n.available_locales.join('|')}/

  root 'home#index'

  scope '(:locale)', locale: localesRegexp do
    get '/', to: 'home#index', as: :localized_root

    namespace :admin do
      resources :initiatives
      resources :ngos
      resources :users
    end

    resources :ngos, only: [:index, :show] do
      resources :initiatives, only: [:index, :show]
    end

    resources :initiatives, only: [] do
      resource :sign, only: [:create], controller: :initiative_signs do
        get 'count', on: :collection
      end
    end

    resources :users, only: [:new, :create], path_names: {new: :signup} do
      get 'validate/:token', on: :collection, to: :validate, as: :validate
    end

    resource :session, only: [:new, :create, :destroy]
  end

  namespace :api do
    resources :ngos, only: [:show, :update]
    resources :initiatives, only: [:show]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
