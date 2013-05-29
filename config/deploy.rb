set :application, "set your application name here"
set :repository,  "set your repository location here"

set :scm, :git
set :branch, "master" # set :branch, fetch(:branch, "master") to use like: cap -S branch=branchname deploy
set :deploy_via, :remote_cache

set :user, 'deploy'
set :use_sudo, false
set :deploy_to, "set the application folder"
server "your.server", :app, :web, :db, :primary => true

# clean up old releases
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"

# run migrations after code update
after 'deploy:update_code', 'deploy:migrate'

namespace :deploy do
  desc "load the database seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
