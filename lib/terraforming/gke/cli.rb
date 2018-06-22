require "google/cloud/container"
require "thor"

module Terraforming
  module GKE
    class CLI < Thor
      def self.common_options
        option :project, type: :string
        option :zone, type: :string
      end

      desc "cluster", "GKE cluster"
      common_options
      def cluster
        puts Terraforming::GKE::GoogleContainerCluster.new(Google::Cloud::Container.new).tf(options[:project], options[:zone])
      end

      desc "node_pool", "GKE node pool"
      common_options
      option :cluster, type: :string
      def node_pool
        puts Terraforming::GKE::GoogleContainerNodePool.new(Google::Cloud::Container.new).tf(options[:project], options[:zone], options[:cluster])
      end
    end
  end
end
