require 'chef/provider/template'
require 'chef/resource/template'

class Chef
  class Provider
    # LogstashForwarder Config File
    class LogstashforwarderFile < Chef::Provider
      def initialize(*args)
        super
      end

      def whyrun_supported?
        true
      end

      def load_current_resource
        true
      end

      def action_create
        new_resource.updated_by_last_action(resource_file)
      end

      def action_remove
        new_resource.updated_by_last_action(true)
      end

      private

      def file_resources
        run_context.resource_collection.select do |resource|
          resource.is_a?(Chef::Resource::LogstashforwarderFile)
        end
      end

      def resource_file
        files = file_resources.map do |resource|
          { 'paths' => resource.paths, 'fields' => resource.fields } if resource.action == :create && !resource.paths.empty? && !resource.fields.empty?
        end

        t = Chef::Resource::Template.new(node['logstashforwarder']['conf_file'], run_context)
        t.cookbook 'logstashforwarder'
        t.source 'logstash-forwarder.conf.erb'
        t.variables :files => files.compact
        t.notifies :restart, 'service[logstash-forwarder]', :delayed if node['logstashforwarder']['notify_restart']
        t.run_action :create
        t.updated_by_last_action?
      end
    end
  end
end
