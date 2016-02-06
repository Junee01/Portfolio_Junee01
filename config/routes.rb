Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  get 'welcome/index'
  root "welcome#index"

  #잘못된 경로로 요청이 오면, 무시해버린다.
  get '*path' => redirect('/')
end
