ChalkboardApp::Application.routes.draw do
  get "error/index"
  mathjax 'mathjax'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "students/new"
  get "static_pages/home"
  get "static_pages/help"
  post "static_pages/contact"
  resources :students
  match '/signup', to: 'students#new', via: 'get'
  match '/activations/:id' => "activations#update", :via => ['get','post']
  get "questions/student_answer_create"

  resources :exams
  resources :downloads 
  get "questions/check_solution"
  resources :reports
  get 'subjects/:subject/:module_test' => 'subjects#show'

  get 'subjects/:subject' => 'subjects#index'
  resources :trackings
  get 'questions/:subject/:module_test/:module_test_name/:number' => 'questions#show'

  match 'pins/:pin/:student/:subject/:activity' => 'pins#show', :via => ['get']
  match 'attendees/:id/:subject' => 'attendees#other', :via => ['get']
  resources :attendees
  resources :classrooms
  resources :pins
  resources :error  
  resources :results
  resources :subscriptions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'
  match '/report/module', to: 'reports#module_index', via: 'get'
  match '/report/test', to: 'reports#test_index', via: 'get'
  
  match '/student_reset_password', to: 'students#student_reset_password',     via: 'post'
  match '/student_reset_password', to: 'students#student_reset_password',     via: 'get'
  match '/forget_password', to: 'students#forget_password',     via: 'post'
  match '/forget_password', to: 'students#forget_password',     via: 'get'
  match '/reset_password', to: 'sessions#reset_password',     via: 'post'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#home'

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
