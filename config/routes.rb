Rails.application.routes.draw do
  # root "posts#index"
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  scope :api, { format: 'json' } do
    resources :posts do 
      resource :votes, only: [:create] 
      resource :comments, only: [:create]
      resource :post_likes, only: [:create, :destroy]
      resource :comment_likes, only: [:create, :destroy]
    end
    resources :users, only: [:show, :update]
    post 'posts/unpublished' => 'posts#unpublished'
    post 'check_current_user' => 'users#checkCurrentUser'
  end

end
