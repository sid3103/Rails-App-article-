
Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
 
  resources :arts do
    resources :resumes
  end

   root 'welcome#index'
   # resources :resumes, only: [:index, :new, :create, :destroy]
end