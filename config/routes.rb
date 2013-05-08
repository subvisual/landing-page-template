LandingPageTemplate::Application.routes.draw do
  match 'home' => 'pages#index', via: 'get'
  root to: 'pages#index'
end
