Rails.application.routes.draw do
  root "posts#index"
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  scope :api, { format: 'json' } do
    resources :posts
  end

end
