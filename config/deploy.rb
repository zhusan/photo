set :application, "set your application name here"
require 'bundler/capistrano'
require 'puma/capistrano'
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

set :application, "photo"

set :scm, :git
set :repository,  "git@github.com:zhusan/photo.git"

set :branch, "master"
set :stage, :production
set :rails_env, "production"
set :user, "zs"
set :use_sudo, false
set :deploy_to, "/home/zs/workspace/#{application}"
set :app_server, :puma

role :web, "zhusan.net"
role :app, "zhusan.net"
role :db,  "zhusan.net", :primary => true

after 'deploy:finalize_update', 'deploy:symlink_db', 'private_pub:restart'

namespace :deploy do
  desc 'Symlinks the database.yml and uploads'

  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/shared/public/uploads #{release_path}/public/uploads"
  end
end

namespace :private_pub do
  desc "Start private_pub server"
  task :start do
    run "cd #{current_path}; RAILS_ENV=production bundle exec rackup private_pub.ru -s thin -E production -D -P tmp/pids/private_pub.pid"
  end
 
  desc "Stop private_pub server"
  task :stop do
    run "cd #{current_path};if [ -f tmp/pids/private_pub.pid ] && [ -e /proc/$(cat tmp/pids/private_pub.pid) ]; then kill -9 `cat tmp/pids/private_pub.pid`; fi"
  end
 
  desc "Restart private_pub server"
  task :restart do
    find_and_execute_task("private_pub:stop")
    find_and_execute_task("private_pub:start")
  end
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
