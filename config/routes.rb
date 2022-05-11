Rails.application.routes.draw do
  resources :line_item_dates
  root to: 'pages#home'
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: %i[index show] do
      resources :line_items, except: %i[index show]
    end
  end
  get 'quotes/index'
end
