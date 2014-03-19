# <a name="title"></a> Kafka Chef Cookbook

## <a name="description"></a> Description

Chef cookbook for [Apache Kafka][kafka], publish-subscribe messaging rethought
as a distributed commit log.

* Website: http://hw-cookbooks.github.io/kafka/
* Source Code: https://github.com/hw-cookbooks/kafka
* IRC Help: [Freenode#heavywater][irc_hw]

## <a name="usage"></a> Usage

Simply include `recipe[kafka]` in your run\_list and Kafka will be installed.
Note that this presumes you already have ZooKeeper instance(s) up and running
for the brokers to connect to.

## <a name="requirements"></a> Requirements

### <a name="requirements-chef"></a> Chef

Tested on 11.10.0 but newer and older versions (of 11) should work just fine.
File an [issue][issues] if this isn't the case.

### <a name="requirements-platform"></a> Platform

The following platforms have been tested with this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu (12.04)
* centos (6.4)

Please [report][issues] any additional platforms so they can be added.

### <a name="requirements-cookbooks"></a> Cookbooks

This cookbook depends on the following external cookbooks:

* [java][cb_java]
* [runit][cb_runit]
* [builder][cb_builder]
* [zookeeperd][cb_zookeeperd]

## <a name="recipes"></a> Recipes

### <a name="recipes-default"></a> default

This recipe downloads, installs, configures, and enables kafka.

### <a name="recipes-discovery"></a> discovery

This recipe discovers other ZooKeeper cluster instances and augments the
`node[:kafka][:config]` configuration hash.

## <a name="attributes"></a> Attributes

* `node[:kafka][:auto_discovery]` - whether or not to perform auto discovery via the discovery recipe (defaults to `true`)
* `node[:kafka][:build_commands]` - commands to compile Kafka (defaults depends on version of Kafka, see [attributes::default](https://github.com/hw-cookbooks/kafka/blob/master/attributes/default.rb))
* `node[:kafka][:conf_dir]` - configuration directory (defaults to `"/etc/kafka/conf"`)
* `node[:kafka][:config]` - Kafka configuration has which will be rendered into *kafka.properties* (defaults depends on version of Kafka, see [attributes::config](https://github.com/hw-cookbooks/kafka/blob/master/attributes/config.rb))
* `node[:kafka][:data_dir]` - data directory for storage (defaults to `"/var/kafka"`)
* `node[:kafka][:download_url]` - full URL for downloading the distribution (defaults depends on version of Kafka, see [attributes::default](https://github.com/hw-cookbooks/kafka/blob/master/attributes/default.rb))
* `node[:kafka][:group]` - group that runs the Kafka service (defaults to `"kafka"`)
* `node[:kafka][:install_dir]` - base installation directory (defaults to `"/opt/kafka"`)
* `node[:kafka][:log_dir]` - log directory (defaults to `"/var/log/kafka"`)
* `node[:kafka][:user]` - user that runs the Kafka service (defaults to `"kafka"`)
* `node[:kafka][:runtime_dir]` - directory in which Kafka will start (defaults to `"/tmp"`)
* `node[:kafka][:version]` - version of Kafka to install (defaults to `"0.7.2"`)

## <a name="lwrps"></a> Resources and Providers

There are **no** resources and providers.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

## <a name="license"></a> License and Author

Author:: [Heavy Water Operations][hw]

Copyright 2011, 2012, 2013, 2014 Heavy Water Operations, LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[cb_builder]:   http://community.opscode.com/cookbooks/builder
[cb_java]:      http://community.opscode.com/cookbooks/java
[cb_runit]:     http://community.opscode.com/cookbooks/runit
[cb_zookeeperd]: http://community.opscode.com/cookbooks/zookeeperd
[irc_hw]:       http://webchat.freenode.net/?channels=heavywater
[kafka]:        http://kafka.apache.org/

[hw]:           http://hw-ops.com
[repo]:         https://github.com/hw-cookbooks/kafka
[issues]:       https://github.com/hw-cookbooks/kafka/issues
