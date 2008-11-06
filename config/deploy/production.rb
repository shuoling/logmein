set :application, "transcendit_logmein"
set :scm, :git
set :repository,"git@gaia:transcendit_logmein.git"
set :branch, "master"
set :user, "transcendit"
set :use_sudo, false

set :domain, 'helios'
role :web, domain
role :app, domain
role :db, domain, :primary => true

namespace :deploy do
    desc "Restarting Application"
    task :restart, :roles => :app, :except => { :no_release => true } do
        run "touch #{current_path}/tmp/restart.txt"
    end

    [:start, :stop].each do |t|
        desc "#{t} task is a no-op with mod_rails"
        task t, :roles => :app do ; end
    end

    desc "Symlink the db."
    task :link_db do
       run "ln -s #{shared_path}/db/development.sqlite3 #{release_path}/db/development.sqlite3"
      run "ln -s #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
    end

    desc "Symlink the database.yml config to current location"
    task :link_images do
        run "ln -s #{shared_path}/images #{release_path}/public/images"
    end
end

after 'deploy:symlink','deploy:link_db'
after 'deploy:symlink','deploy:link_images'