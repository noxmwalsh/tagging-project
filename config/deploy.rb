# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'Tagger'
set :repo_url, 'git@github.com:noxmwalsh/tagging-project.git'
set :deploy_to, '/var/www/tagging_system'
set :uploads_path, "#{current_path}/public"
set :log_level, :info
set :linked_files, %w[ config/database.yml config/secrets.yml ]
set :linked_dirs, %w[ log tmp/pids tmp/cache tmp/sockets public/uploads ]
set :rails_env, 'production'
set :use_sudo, false
set :user, "deploy"
set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
set :keep_releases, Float::INFINITY if ENV['CI']
set :bundle_jobs, 4
