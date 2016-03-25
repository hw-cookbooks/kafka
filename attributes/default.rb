#
# Cookbook Name:: kafka
# Attributes:: default
#
# Copyright 2014, Heavy Water Operations, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

::Chef::Node.send(:include, ChefKafka::Helpers)

default[:kafka][:version] = "0.8.2.1"
default[:kafka][:download_url] = kafka_download_url(node[:kafka][:version])

default[:kafka][:install_dir] = "/opt/kafka"
default[:kafka][:data_dir] = "/var/kafka"
default[:kafka][:conf_dir] = "/etc/kafka/conf"
default[:kafka][:runtime_dir] = "/tmp"
default[:kafka][:log_dir] = "/var/log/kafka"
default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"
default[:kafka][:shell] = "/bin/false"
default[:kafka][:build_commands] = []
default[:kafka][:jmx_opts] = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false  -Dcom.sun.management.jmxremote.ssl=false "
default[:kafka][:jmx_port] = nil

default[:kafka][:auto_discovery] = true

default[:kafka][:zk_prefix] = kafka_zk_prefix()

default[:gradle][:url] = "https://services.gradle.org/distributions/gradle-2.3-bin.zip"
default[:gradle][:version] = "2.3"
default[:gradle][:home_dir] = "/usr/local/gradle"

