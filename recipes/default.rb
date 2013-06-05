#
# Cookbook Name:: kafka
# Recipe:: default
#
# Copyright 2011, Heavy Water Ops, LLC
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

include_recipe "runit"
include_recipe "java"
include_recipe "kafka::discovery" if node[:kafka][:auto_discovery]

node.default[:kafka][:download_url] = File.join(
  node[:kafka][:base_url], "kafka-#{node[:kafka][:version]}-incubating",
  "kafka-#{node[:kafka][:version]}-incubating-src.tgz"
)

tarball = File.basename(node[:kafka][:download_url])
version_dir = "kafka-#{node[:kafka][:version]}"
base_dir = File.join(node[:kafka][:install_dir], version_dir)

group node[:kafka][:group]

user node[:kafka][:user] do
  comment "Kafka user"
  gid node[:kafka][:group]
  home "#{node[:kafka][:install_dir]}/kafka"
  shell "/bin/noshell"
  system true
end

directory base_dir do
  recursive true
end

builder_remote version_dir do
  remote_file node[:kafka][:download_url]
  suffix_cwd tarball.sub(File.extname(tarball), '')
  commands [
    "./sbt update",
    "./sbt package",
    "cp -R . #{base_dir}"
  ]
  creates File.join(base_dir, "bin/kafka-server-start.sh")
end

link "#{node[:kafka][:install_dir]}/kafka" do
  to base_dir
end

runit_service "kafka"

node.default[:kafka][:config]["log.dir"] = node[:kafka][:log_dir]
node.default[:kafka][:config]["brokerid"] =
  %x{hostid}.to_i(16) unless node[:kafka][:config]["brokerid"]

template '/etc/kafka/conf/kafka.properties' do
  source 'kafka.properties.erb'
  mode 0644
  notifies :restart, 'service[kafka]'
end

service "kafka" do
  action :enable
  subscribes :restart, resources("template[/etc/kafka/conf/kafka.properties]"), :immediately
end
