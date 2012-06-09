set :stages, %w(staging testing)
set :default_stage, "testing"
require 'capistrano/ext/multistage'

set :application, "cakephpDefault"

after "deploy", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app do
    run "/etc/init.d/apache2 restart"
    run "/etc/init.d/apache2 reload"
    clear_cache
  end

  task :config_folder do
    run "mkdir -p #{shared_path}/tmp/cache/models"
    run "mkdir -p #{shared_path}/tmp/cache/persistent"
    run "mkdir -p #{shared_path}/tmp/session"
    run "mkdir -p #{shared_path}/tmp/test"
    run "mkdir -p #{shared_path}/tmp/logs"
    run "mkdir -p #{shared_path}/config"
  end

  after "deploy:setup", "deploy:config_folder"

  task :finalize_update, :roles => :app do

    #Link tmp {current_release}/app/tmp
    run "ln -s #{shared_path}/tmp #{current_release}/app/tmp"
    

    #run "chmod -R 777 #{current_release}/app/tmp"
    
    # Link configuration files
    run "ln -sf #{shared_path}/config/core.php #{current_release}/app/Config/core.php"
    run "ln -sf #{shared_path}/config/database.php #{current_release}/app/Config/database.php"
    run "ln -sf #{shared_path}/pdf #{current_release}/app/webroot/files/pdf"
    run "ln -sf #{shared_path}/attached #{current_release}/app/webroot/img/attached"
    run "rm -rf #{current_release}/app/tmp/cache/persistent/cake_core_*"
    

    desc <<-DESC
    Running Migrations for application and plugin
    DESC
    #Running all migrations
    run "cd #{current_release}/app && Console/cake Migrations.migration run all"
    #run "cd #{current_release}/app && cake migration -plugin cms run all > /dev/null"
    #run "cd #{current_release}/app && cake migration -plugin enquiry run all > /dev/null"
  end
end


namespace :clear_cache do
  desc <<-DESC
    Blow up all the cache files CakePHP uses, ensuring a clean restart.
  DESC
  task :default do
     Remove absolutely everything from TMP
    run "rm -r #{shared_path}/tmp/*"

    # Create TMP folders
    run "mkdir -p #{shared_path}/tmp/{cache/{models,persistent,views},sessions,logs,tests}"
  end
end