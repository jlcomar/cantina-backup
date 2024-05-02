Rails.application.routes.draw do
  concern :activatable do
    member do
      put :activate
      put :deactivate
    end
  end

  
  namespace :main, path: '', path_names: { new: 'novo', create: 'novo', edit: 'editar', update: 'editar' } do
    root 'dashboards#index'
    
    resources :sales, path: 'vendas', except: [:edit, :update]

    with_options concerns: [:activatable], except: [:destroy] do
      resources :products, path: 'produtos'
      resources :customers, path: 'clientes'
    end
  end
end
