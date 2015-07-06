default['logstashforwarder']['yum']['description'] = 'Elastic LogstashForwarder Repository'
default['logstashforwarder']['yum']['gpgcheck'] = true
default['logstashforwarder']['yum']['enabled'] = true
default['logstashforwarder']['yum']['baseurl'] = 'http://packages.elasticsearch.org/logstashforwarder/centos'
default['logstashforwarder']['yum']['gpgkey'] = 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
default['logstashforwarder']['yum']['mirrorlist'] = nil
default['logstashforwarder']['yum']['action'] = :create

default['logstashforwarder']['apt']['description'] = 'Elastic LogstashForwarder Repository'
default['logstashforwarder']['apt']['components'] = %w(stable main)
default['logstashforwarder']['apt']['uri'] = 'http://packages.elasticsearch.org/logstashforwarder/debian'
default['logstashforwarder']['apt']['key'] = 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
default['logstashforwarder']['apt']['action'] = :add
