Run::Application.routes.draw do
  resources :templates

  resources :categories

  resources :teams do
    member do
      put 'join'
      get 'remove_athlete/:user_id' =>  'teams#remove_athlete'
    end
  end

  devise_for :users, :controllers => { :registrations => "myregistrations" } do
    match '/users/sign_up/:type' => 'myregistrations#new'
    match '/users/create_athlete' => 'myregistrations#create_athlete'
  end

  match "/home" => "home#index", as: "user_root" # new format of setting root paths for devise
  root :to => "home#index"
  
  match '/users/prof_kei' => 'users#prof_kei'
  match '/users/prof_liz' => 'users#prof_liz'
  match '/users/prof_riza' => 'users#prof_riza'
  match '/users/prof_ru' => 'users#prof_ru'
  match '/users/about_us' => 'users#about_us'
  match '/users/help' => 'users#help'
  match '/users/create_team' => 'users#create_team'
  match '/users/edit_team' => 'users#edit_team'
  match '/users/view_template' => 'users#view_template'
  match '/users/edit_template' => 'users#edit_template'
  match '/users/create_template' => 'users#create_template'  
  match '/users/create_session' => 'users#create_session'
  match '/users/performance_indiv' => 'users#performance_indiv'
  match '/users/performance_team' => 'users#performance_team'
  match '/users/performance_logs' => 'users#performance_logs'
  match '/users/pending' => 'users#pending'
  match '/users/fillout' => 'users#fillout'            
  match '/users/athlete_overall' => 'users#athlete_overall'
  match '/users/athlete_session' => 'users#athlete_session'
  match '/users/athlete_logs' => 'users#athlete_logs'
  match '/users/request' => 'users#request'
  match '/users/edit_profile' => 'users#edit_profile'  
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
  # match ':controller(/:action(/:id(.:format)))'
end
