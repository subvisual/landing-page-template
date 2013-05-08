LandingPageTemplate::Application.routes.draw do
  get 'index' => 'pages#index'
  post 'confirm' => 'users#create'

  root to: 'pages#index'
end
