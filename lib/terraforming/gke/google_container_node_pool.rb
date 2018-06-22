require "erb"

module Terraforming
  module GKE
    class GoogleContainerNodePool
      def self.tf(client = nil)
        self.new(client).tf
      end

      def initialize(client)
        @client = client
      end

      def tf(project, zone, cluster)
        node_pools = @client.list_node_pools(project, zone, cluster).node_pools
        template = open(File.join(File.expand_path(File.dirname(__FILE__)), "template", "google_container_node_pool.tf.erb")).read
        ERB.new(template, nil, "-").result(binding)
      end

      private

      def resource_name_of(cluster, node_pool)
        "#{cluster}_#{node_pool.name}".gsub("-", "_")
      end
    end
  end
end
