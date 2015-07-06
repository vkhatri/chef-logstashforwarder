logstashforwarder Cookbook
==============================

[![Build Status](https://travis-ci.org/vkhatri/chef-logstashforwarder.svg?branch=master)](https://travis-ci.org/vkhatri/chef-logstashforwarder)

This is a [Chef] cookbook to manage [LogStashForwarder] via HWRP.

This cookbook was heavily inspired from logstash cookbook maintained by jsirex.

More features and attributes will be added over time, **feel free to contribute**
what you find missing!

## Repository

https://github.com/vkhatri/chef-logstashforwarder


## Supported OS

This cookbook was tested on Amazon (2015-03) and expected to work on similar platform family OS.


## Supported LogstashForwarder Version

This cookbook was tested for logstash-forwarder v0.4.0.


## Supported LogstashForwarder Deployment

This cookbook supports both Package and Binary based installation.


## Recipes

- `logstashforwarder::default` - default recipe (use it for run_list)

- `logstashforwarder::install` - install logstash-forwarder via package or tarball

- `logstashforwarder::golang` - install golang package

- `logstashforwarder::package` - install logstash-forwarder using repository package

- `logstashforwarder::binary` - install logstash-forwarder using binary

- `logstashforwarder::user` - setup user/group for logstash-forwarder service

- `logstashforwarder::config` - configure logstash-forwarder


## Cookbook Advanced Attributes

* `default['logstashforwarder']['install_method']` (default: `package`): logstash-forwarder install method, options: package tarball

* `default['logstashforwarder']['install_golang']` (default: `true`): whether to install golang package

* `default['logstashforwarder']['notify_restart']` (default: `true`): whether to notify logstash-forwarder service on any config change

* `default['logstashforwarder']['setup_user']` (default: `true`): whether to setup logstash-forwarder service user when installing via binary


## Cookbook Core Attributes

* `default['logstashforwarder']['version']` (default: `0.4.0`): logstash-forwarder version, currently does not serve any purpose

* `default['logstashforwarder']['user']` (default: `logstash-forwarder`): logstash-forwarder service user

* `default['logstashforwarder']['group']` (default: `logstash-forwarder`): logstash-forwarder service group

* `default['logstashforwarder']['conf_file']` (default: `/etc/logstash-forwarder.conf`): logstash-forwarder configuration file

* `default['logstashforwarder']['log_dir']` (default: `/var/log/logstash-forwarder`): logstash-forwarder log directory

* `default['logstashforwarder']['home_dir']` (default: `logstash-forwarder`): logstash-forwarder home directory

* `default['logstashforwarder']['binary_url']` (default: `https://download.elastic.co/logstash-forwarder/binaries/logstash-forwarder_linux_amd64`): logstash-forwarder binary source url

* `default['logstashforwarder']['binary_checksum']` (default: `5f49c5be671fff981b5ad1f8c5557a7e9973b24e8c73dbf0648326d400e6a4a1`): logstash-forwarder binary source sha256sum

* `default['logstashforwarder']['parent_dir']` (default: `/usr/local/logstash-forwarder`): logstash-forwarder directory for binary based installation

* `default['logstashforwarder']['mode']` (default: `0755`): file/directory resource mode

* `default['logstashforwarder']['daemon']` (default: `calculated`): logstash-forwarder binary location


## LogstashForwarder Config Attributes

* `default['logstashforwarder']['config']['network']['servers']` (default: `[]`): logstash lumberjack servers, `user needs to set this attribute for cookbook to work`

* `default['logstashforwarder']['config']['network']['ssl_ca']` (default: `calculated`): logstash server lumberjack protocol ssl ca cert

* `default['logstashforwarder']['config']['network']['timeout']` (default: `15`):  logstash server timeout


## LogstashForwarder YUM/APT Repository Attributes

* `default['logstashforwarder']['yum']['description']` (default: `Elastic LogstashForwarder Repository`): logstash-forwarder yum reporitory attribute

* `default['logstashforwarder']['yum']['gpgcheck']` (default: `true`): logstash-forwarder yum reporitory attribute

* `default['logstashforwarder']['yum']['enabled']` (default: `true`): logstash-forwarder yum reporitory attribute

* `default['logstashforwarder']['yum']['baseurl']` (default: `calculated`): logstash-forwarder yum reporitory attribute

* `default['logstashforwarder']['yum']['gpgkey']` (default: `https://packages.elasticsearch.org/GPG-KEY-elasticsearch`): logstash-forwarder yum reporitory attribute

* `default['logstashforwarder']['yum']['mirrorlist']` (default: `nil`): logstash-forwarder reporitory attribute

* `default['logstashforwarder']['yum']['action']` (default: `:create`): logstash-forwarder yum reporitory attribute


* `default['logstashforwarder']['apt']['description']` (default: `Elastic LogstashForwarder Repository`): logstash-forwarder apt reporitory attribute

* `default['logstashforwarder']['apt']['components']` (default: `['stable', 'main']`): logstash-forwarder apt reporitory attribute

* `default['logstashforwarder']['apt']['uri']` (default: `calculated`): logstash-forwarder apt reporitory attribute

* `default['logstashforwarder']['apt']['key']` (default: `http://packages.elasticsearch.org/GPG-KEY-elasticsearch`): logstash-forwarder apt reporitory attribute

* `default['logstashforwarder']['apt']['action']` (default: `:add`): logstash-forwarder apt reporitory attribute



## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[LogStashForwarder]: https://www.elastic.co/products/logstash
[Contributors]: https://github.com/vkhatri/chef-logstashforwarder/graphs/contributors
[Chef Supermarket]: https://supermarket.chef.io/cookbooks/logstashforwarder
