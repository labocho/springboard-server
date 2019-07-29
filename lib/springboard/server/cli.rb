require "fileutils"

module Springboard
  module Server
    class CLI
      include FileUtils

      DIR = "#{ENV["HOME"]}/.springboard-server".freeze

      def self.start(argv)
        new.start(argv)
      end

      def start(argv)
        mkdir(DIR) unless Dir.exist?(DIR)
        cp("#{__dir__}/Vagrantfile", "#{DIR}/Vagrantfile") unless File.exist?("#{DIR}/Vagrantfile")

        ENV["VAGRANT_CWD"] = DIR
        exec "vagrant", *argv
      end
    end
  end
end
