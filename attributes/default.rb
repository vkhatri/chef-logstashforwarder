# version attribute does not have any significance
default['logstashforwarder']['version'] = '0.4.0'

default['logstashforwarder']['user'] = 'logstashforwarder'
default['logstashforwarder']['group'] = 'logstashforwarder'
default['logstashforwarder']['setup_user'] = true

default['logstashforwarder']['notify_restart'] = true

default['logstashforwarder']['install_golang'] = true
default['logstashforwarder']['install_method'] = 'package' # options: binary package

default['logstashforwarder']['binary_url'] = 'https://download.elastic.co/logstash-forwarder/binaries/logstash-forwarder_linux_amd64'
default['logstashforwarder']['binary_checksum'] = '5f49c5be671fff981b5ad1f8c5557a7e9973b24e8c73dbf0648326d400e6a4a1'

default['logstashforwarder']['cookbook']     = 'logstashforwarder'

default['logstashforwarder']['mode']     = '0775'
default['logstashforwarder']['log_dir']      = '/var/log/logstash-forwarder'
default['logstashforwarder']['home_dir']     = '/var/lib/logstash-forwarder'
default['logstashforwarder']['conf_file']     = '/etc/logstash-forwarder.conf'

# for binary installation
default['logstashforwarder']['parent_dir']   = '/usr/local/logstash-forwarder'
default['logstashforwarder']['binary_dir']   = ::File.join(node['logstashforwarder']['parent_dir'], 'bin')
default['logstashforwarder']['binary_file'] = node['logstashforwarder']['install_method'] == 'binary' ? ::File.join(node['logstashforwarder']['binary_dir'], 'logstash-forwarder') : '/opt/logstash-forwarder/bin/logstash-forwarder'

default['logstashforwarder']['enable_syslog'] = true

default['logstashforwarder']['ssl_home'] = value_for_platform_family(
  'debian' => '/etc/ssl/certs',
  %w(rhel fedora) => '/etc/pki/tls/certs'
)
