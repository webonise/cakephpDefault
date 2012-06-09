set :deploy_to, "/var/www/" #for testing

set :scm, :git
set :repository,  "git@github.com:webonise/cakephpDefault.git"
set :branch, "testing"
set :keep_releases, 3

location = "testing.#{application}.net"

role :app, location
role :web, location
role :db, location, :primary => true

set :user, ''
set :password, ''
set :ssh_options, {:forward_agent => true}
