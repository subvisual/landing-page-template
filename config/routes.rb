LandingPageTemplate::Application.routes.draw do
  get 'index' => 'pages#index'
  post 'confirm' => 'users#create'
  
  get 'referral/:token' => 'pages#referral', as: 'referral'

  root to: 'pages#index'
end
