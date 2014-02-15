set :application, "set your application name here"
require 'bundler/capistrano'
require 'sidekiq/capistrano'
require 'puma/capistrano'
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

set :application, "photo"

set :scm, :git
set :repository,  "git@github.com:zhusan/photo.git"

gem 'capistrano-rbenv'
set :branch, "master"
set :stage, :production
set :rails_env, "production"
set :user, "zs"
set :use_sudo, false
gem 'capistrano-rbenv'
gem 'capistrano-rbenv'
set :deploy_to, "/home/zs/workspace/#{application}"
set :app_server, :puma
gem 'capistrano-rbenv'
set :normalize_asset_timestamps, false

role :web, "zhusan.net"
role :app, "zhusan.net"
role :db,  "zhusan.net", :primary => true



namespace :deploy do
  desc "cause Passenger to initiate a restart"

  task :restart do
    run"touch #{current_path}/tmp/restart.txt"
  end

  desc "reload thedatabase with seed data"
  task :seed do
    run"cd#{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

after "deploy:update_code", :bundle_install
desc "install thenecessary prerequisites"

task :bundle_install, :roles => :app do
  run"cd#{release_path} && bundle install"
end
