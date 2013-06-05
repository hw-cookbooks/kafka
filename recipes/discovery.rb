#
# Cookbook Name:: kafka
# Recipe:: discovery
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

include_recipe "zookeeperd::discovery"

node.set[:kafka][:config]['enable.zookeeper'] = true
node.set[:kafka][:config]["zk.connect"] = node[:zookeeperd][:config].map do |k,v|
  next unless k.start_with?("server.")
  v.split(":")[0,2].join(':')
end.compact.join(',')

