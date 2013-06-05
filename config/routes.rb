LandingPageTemplate::Application.routes.draw do
  get 'home' => 'pages#index'
  post 'confirm' => 'users#create'
  
  get 'referral/:token' => 'pages#referral', as: 'referral'

  root to: 'pages#index'
end
