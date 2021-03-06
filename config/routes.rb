Blog1::Application.routes.draw do

  devise_for :users, path: "", path_names: { sign_in: 'login', sign_out: 'logout', confirmation: 'verification', unlock: 'unblock', registration: 'account', sign_up: 'new' }

  resources :users, only: [:show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

    root 'posts#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

      get 'admin' => 'posts#admin'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

      #get ':username' => 'users#show', as: :user

      get 'new' => 'posts#new', as: :new_post
      get ':slug' => 'posts#show', as: :post
      get ':slug/edit' => 'posts#edit', as: :edit_post
      patch ':slug' => 'posts#update'
      put ':slug' => 'posts#update'
      delete ':slug' => 'posts#destroy'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

      resources :posts, only: [:create]

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
