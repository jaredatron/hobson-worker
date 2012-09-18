require 'hobson/worker/version'
require 'yaml'

module Hobson
  class Worker < Resque::Worker

    # CONFIG = ENV['HOBSON_WORKER_CONFIG'] || 'config/hobson.yml'

    def self.work!
      # config = YAML.load_file(CONFIG) or raise "cant find config"
      # Resque.redis = Redis.new #(config[:redis])
      worker = new('hobson_fast_lane', 'hobson')
      worker.verbose = true
      worker.very_verbose = $DEBUG
      worker.work
    end

  end
end

Hobson::Worker.work!
