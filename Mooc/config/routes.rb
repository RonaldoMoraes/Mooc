Rails.application.routes.draw do

  resources :steps
  get 'tutorials/search_tutorial' => "tutorials#search_tutorial", as: 'search_tutorial'
  get 'tutorials/my_tutorials' => "tutorials#my", as: 'my_tutorials'
  get 'tutorials/follow_tutorial/:id' => "tutorials#follow", as: 'follow_tutorial'
  get 'tutorials/unfollow_tutorial/:id' => "tutorials#unfollow", as: 'unfollow_tutorial'
  get 'tutorials/like_tutorial/:id' => "tutorials#like", as: 'like_tutorial'
  get 'tutorials/unlike_tutorial/:id' => "tutorials#unlike", as: 'unlike_tutorial'
  resources :tutorials

  resources :categories
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/edit_interest' => "users/registrations#edit_interest", as: 'edit_interest'
    put 'users/update_interest' => "users/registrations#update_interest", as: 'update_interest'
  end

  get 'home/index'
  get 'home/about'
  root to: "home#index"
  
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
