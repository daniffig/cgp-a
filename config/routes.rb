Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :presentations, format: false, class_name: 'ProductPresentations'
  end

  namespace :api do
    namespace :v1 do
      jsonapi_resources :brands, only: [:index, :show]
      jsonapi_resources :products, only: [:index, :show]
    end
  end

  root 'admin/presentations#index'
end
