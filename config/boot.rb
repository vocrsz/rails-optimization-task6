ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require 'bootsnap'
env = ENV['RAILS_ENV'] || "development"

if ENV['RAILS_ENV'] != 'production'
  Bootsnap.setup(
    cache_dir:            'tmp/cache',          # Path to your cache
    ignore_directories:   ['node_modules'],     # Directory names to skip.
    development_mode:     env == 'development', # Current working environment, e.g. RACK_ENV, RAILS_ENV, etc
    load_path_cache:      true,                 # Optimize the LOAD_PATH with a cache
    compile_cache_iseq:   true,                 # Compile Ruby code into ISeq cache, breaks coverage reporting.
    compile_cache_yaml:   true,                 # Compile YAML into a cache
    compile_cache_json:   true,                 # Compile JSON into a cache
    readonly:             true,                 # Use the caches but don't update them on miss or stale entries.
  )
end
