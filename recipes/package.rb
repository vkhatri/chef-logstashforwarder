#
# Cookbook Name:: logstashforwarder
# Recipe:: package
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

case node['platform_family']
when 'debian'
  # apt repository configuration
  apt_repository 'logstashforwarder' do
    uri node['logstashforwarder']['apt']['uri']
    components node['logstashforwarder']['apt']['components']
    key node['logstashforwarder']['apt']['key']
    action node['logstashforwarder']['apt']['action']
  end
when 'rhel'
  # yum repository configuration
  yum_repository 'logstashforwarder' do
    description node['logstashforwarder']['yum']['description']
    baseurl node['logstashforwarder']['yum']['baseurl']
    mirrorlist node['logstashforwarder']['yum']['mirrorlist']
    gpgcheck node['logstashforwarder']['yum']['gpgcheck']
    gpgkey node['logstashforwarder']['yum']['gpgkey']
    enabled node['logstashforwarder']['yum']['enabled']
    action node['logstashforwarder']['yum']['action']
  end
end

# install logstash-forwarder
package 'logstash-forwarder' do
  notifies :restart, 'service[logstash-forwarder]', :delayed
end
