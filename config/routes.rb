Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/' => 'alumno#index'
  
#   get 'curriculum/' => 'curriculum#index'
#   get 'curriculum/crear'
#   post 'curriculum/crear' =>  'curriculum#crear'
#   post 'curriculum/borrar' =>  'curriculum#borrar'
#   get 'curriculum/actualizar'
#   post 'curriculum/:id/actualizar' => 'curriculum#actualizar'


#   get 'curso/' => 'curso#index'
#   get 'curso/crear'
#   post 'curso/crear' => 'curso#crear'
#   post  'curso/borrar' => 'curso#borrar'
#   get 'curso/actualizar'
#   post 'curso/:id/actualizar' => 'curso#actualizar'

  get 'ponente/' => 'ponente#index'
  get 'ponente/mostrar'
  
  get 'alumno/' => 'alumno#index'
  get 'alumno/mostrar'

   get 'usuario/' => 'ponente#index'
   get 'usuario/registrar'
   post 'usuario/registrar' => 'usuario#registrar'
   get 'usuario/borrar'
   get 'usuario/actualizar'
   post 'usuario/actualizar' => 'usuario#actualizar'

   get 'usuario/iniciarSesion'
   post 'usuario/iniciarSesion' => 'usuario#iniciarSesion'
   get 'usuario/cerrarSesion'

   get 'curriculum/crear'
   post 'curriculum/crear' => 'curriculum#crear'
   get 'curriculum/actualizar'
   post 'curriculum/actualizar' => 'curriculum#actualizar'

   get 'curso/crear'
   post 'curso/crear' => 'curso#crear'
   get 'curso/actualizar'
   post 'curso/actualizar' => 'curso#actualizar'
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
