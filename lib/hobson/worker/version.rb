require 'resque'

module Hobson
  class Worker < Resque::Worker
    VERSION = "0.0.1"
  end
end
