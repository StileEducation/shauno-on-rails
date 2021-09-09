# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "shauno-on-rails"
set :repo_url, "https://github.com/StileEducation/shauno-on-rails.git"

# Deploy to the user's home directory
set :deploy_to, "/home/ubuntu/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5


#
set :ssh_options, {keys: '~/.ssh/internsRSA.pem'}