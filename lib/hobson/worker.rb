module Hobson
  class Worker < Resque::Worker

    def self.work!
      config = YAML.load_file('config/hobson.yml') or raise "cant find config"
      Resque.redis = Redis.new(config[:redis])
      worker = new
      worker.verbose = true
      worker.very_verbose = $DEBUG
      worker.work
    end

  end
end


Hobson::Worker.work!
