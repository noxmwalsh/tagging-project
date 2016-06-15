set :rails_env, 'production'
set :puma_env, 'production'
server 'chartio-101.org', user: 'deploy', roles: %w[web app db]
set :nginx_server_name, "chartio.org"
set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
set :puma_workers, 4
