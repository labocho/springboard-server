require "springboard/server/version"

module Springboard
  module Server
    require_relative "server/cli"

    class Error < StandardError; end
  end
end
