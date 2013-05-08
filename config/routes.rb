LandingPageTemplate::Application.routes.draw do
  match 'index' => 'pages#index', via: 'get'
  match 'confirm' => 'users#create', via: 'post'
  root to: 'pages#index'
end
