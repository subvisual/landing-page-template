LandingPageTemplate::Application.routes.draw do
  match 'index' => 'pages#index', via: 'get'
  match 'confirm' => 'pages#confirm', via: 'post'
  root to: 'pages#index'
end
