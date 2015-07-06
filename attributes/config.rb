default['logstashforwarder']['config']['network']['servers'] = []
# TODO
# read ssl cert bundle from data bag
# make these two optional
#
# default['logstashforwarder']['config']['network']['ssl_certificate'] = ::File.join(node['logstashforwarder']['ssl_home'], 'logstash-cert.pem')
# default['logstashforwarder']['config']['network']['ssl_key'] = ::File.join(node['logstashforwarder']['ssl_home'], 'logstash-key.pem')
default['logstashforwarder']['config']['network']['ssl_ca'] = ::File.join(node['logstashforwarder']['ssl_home'], 'logstash-ca.pem')
default['logstashforwarder']['config']['network']['timeout'] = 15
