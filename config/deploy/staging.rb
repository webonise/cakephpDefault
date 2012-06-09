set :deploy_to, "/var/www/" #for staging

set :scm, :git
set :repository,  "git@github.com:webonise/cakephpDefault.git"
set :branch, "staging"
set :keep_releases, 3

location = "staging.#{application}.net"

role :app, location
role :web, location
role :db, location, :primary => true

set :user, ''
set :password, ''
set :ssh_options, {:forward_agent => true}
