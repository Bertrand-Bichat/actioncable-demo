Rails.application.routes.draw do
  devise_for :users
  resources :restaurants

  # root page = sign_in page of devise
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
