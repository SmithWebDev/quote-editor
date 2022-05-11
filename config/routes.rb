Rails.application.routes.draw do
  get 'line_item/new'
  get 'line_item/create'
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
