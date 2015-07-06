require 'chef/resource'

class Chef
  class Resource
    # LogstashForwarder Configuration File Path
    class LogstashforwarderFile < Chef::Resource
      identity_attr :name

      def initialize(name, run_context = nil)
        super
        @resource_name = :logstashforwarder_file
        @provider = Chef::Provider::LogstashforwarderFile
        @action = :create
        @allowed_actions = [:create, :delete, :nothing]
        @name = name
      end

      def paths(arg = nil)
        set_or_return(
          :paths, arg,
          :required => true,
          :kind_of => Array,
          :default => []
        )
      end

      def fields(arg = nil)
        set_or_return(
          :fields, arg,
          :required => true,
          :kind_of => Hash,
          :default => {}
        )
      end
    end
  end
end
