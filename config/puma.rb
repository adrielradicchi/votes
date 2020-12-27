# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
# max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
# min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
# threads min_threads_count, max_threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
#
# worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
# port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
# environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
# pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.

app_dir  =  File.expand_path("../..", __FILE__)
shared_dir  =  "#{app_dir}/tmp"

environment ENV["RACK_ENV"] ||  "development"
threads_count  =  Integer(ENV["MAX_THREADS"] ||  1) # this is should be calculated so (web_concurrency * max_threads * num dynos) PLUS whatever other db threads will be used (by workers for example) is < than allowed heroku pg connections.
threads threads_count, threads_count

preload_app!
rackup DefaultRackup

if  ENV["RACK_ENV"].nil? ||  ENV["RACK_ENV"] ==  "development"  # don't need this for production just local
  port ENV["PORT"] ||  3000
else
  # easier to debug if development is running in single process
  workers Integer(ENV["WEB_CONCURRENCY"] ||  1) # this should be upped in prod as it's using 3 for 1x dyno, 6 for 2x
  # bind "ssl://127.0.0.1:#{ENV['SSL_PORT'] || 3001}?key=#{ENV['SSL_KEY']}&cert=#{ENV['SSL_CERT']}"
  # Deamonize puma server to run in background
  daemonize
  # Set up puma to listen on unix socket location(instead of tcp)
  #bind "unix://#{shared_dir}/sockets/rev1.sock?umask=0111"
  port ENV["PORT"] ||  3000
  # Redirect puma logs(access and error) for this site to shared/logs dir
  stdout_redirect "#{shared_dir}/logs/rev1.stdout.log", "#{shared_dir}/logs/rev1.stderr.log", true
  # Set master PID and state locations
  pidfile "#{shared_dir}/pids/rev1.pid"
  state_path "#{shared_dir}/pids/rev1.state"
  activate_control_app
end

before_fork do
  require  "puma_worker_killer"
  unless  Rails.env.development? ||  Rails.env.test?
    PumaWorkerKiller.enable_rolling_restart(3  *  3600)
  end
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
    # Worker specific setup for Rails 4.1+
    # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
    ActiveRecord::Base.establish_connection
end

plugin :tmp_restart
