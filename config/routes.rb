Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  unauthenticated do
    root 'users#home'
  end

  root 'groups#index', as: 'spending'

  resources :users

  resources :groups, only: %i[index show new create destroy] do
    resources :spendings, only: %i[new show create destroy]
  end
end
