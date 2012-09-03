Bandcalls::Application.routes.draw do
  resources :user_requests

  resources :artist_calls
  
  match 'twilio/entry' => 'artist_calls#entry'
  match 'twilio/recording' => 'artist_calls#recording'

  devise_for :users
  devise_scope :user do
     get "signout", :to => "devise/sessions#destroy"
     get "signup", :to => "devise/registrations#new"
   end
   
  devise_for :artists
  devise_scope :artist do
     get "artist_signout", :to => "devise/sessions#destroy"
     get "artist_signup", :to => "devise/registrations#new"
   end
   
   
   
   match 'artists/requests' => 'user_requests#artist_index', :as => :artist_requests
   match 'message_script/:user_request_id' => 'artist_calls#message_script', :as => :message_script
   
   match 'artist_calls/create/:user_request_id' => 'artist_calls#create', :as => :create_artist_call
   match 'user_request/new/:artist_id' => 'user_requests#new', :as => :new_user_request
   
   match 'artists' => 'artists#index'
   match 'artists/:id' => 'artists#show', :as => :show_artist
   
   
  root :to => "home#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
