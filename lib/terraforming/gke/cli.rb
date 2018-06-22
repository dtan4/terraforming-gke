require "google/cloud/container"
require "thor"

module Terraforming
  module GKE
    class CLI < Thor
      def self.cli_options
        option :project, type: :string
        option :zone, type: :string
      end

      desc "cluster", "GKE cluster"
      cli_options
      def cluster
        puts Terraforming::GKE::GoogleContainerCluster.new(Google::Cloud::Container.new).tf(options[:project], options[:zone])
      end

      desc "node_pool", "GKE node pool"
      cli_options
      def node_pool
        raise NotImplementedError
      end
    end
  end
end
