#
# Cookbook Name:: logstashforwarder
# Recipe:: config
#
# Copyright 2015, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# set node attribute for logstash forwarder version,
ruby_block 'set logstash-forwarder version' do
  block do
    cmd = Mixlib::ShellOut.new("#{node['logstashforwarder']['binary_file']} --version")
    cmd.run_command
    node.set['logstashforwarder']['binary_version'] = cmd.stdout.strip
  end
  only_if { ::File.exist?(node['logstashforwarder']['binary_file']) }
end

# sysv init file
template '/etc/init.d/logstash-forwarder' do
  cookbook node['logstashforwarder']['cookbook']
  source 'initd.erb'
  owner 'root'
  group 'root'
  mode 0755
  notifies :restart, 'service[logstash-forwarder]', :delayed if node['logstashforwarder']['notify_restart']
end

fail ">> must provide at least one logstash server node['logstashforwarder']['config']['network']['servers']" if node['logstashforwarder']['config']['network']['servers'].empty?

ruby_block 'delay logstash-forwarder service start' do
  block do
  end
  notifies :start, 'service[logstash-forwarder]', :delayed
end

service 'logstash-forwarder' do
  supports :status => true, :restart => true
  action [:enable]
end
