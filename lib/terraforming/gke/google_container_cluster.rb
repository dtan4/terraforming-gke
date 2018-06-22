require "erb"

module Terraforming
  module GKE
    class GoogleContainerCluster
      def self.tf(client = nil)
        self.new(client).tf
      end

      def initialize(client)
        @client = client
      end

      def tf(project, zone)
        clusters = @client.list_clusters(project, zone).clusters
        template = open(File.join(File.expand_path(File.dirname(__FILE__)), "template", "google_container_cluster.tf.erb")).read
        ERB.new(template, nil, "-").result(binding)
      end

      private

      def resource_name_of(cluster)
        cluster.name.gsub("-", "_")
      end
    end
  end
end
