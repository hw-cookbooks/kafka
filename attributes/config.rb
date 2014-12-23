#
# Cookbook Name:: kafka
# Attributes:: config
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

# ensure node.kafka.version is loaded
include_attribute "kafka::default"

default[:kafka][:config] = Mash[
  'hostname', node[:fqdn],
  'port', 9092,
  'num.threads', 8,
  'socket.send.buffer', 1048576,
  'socket.receive.buffer', 1048576,
  'max.socket.request.bytes', 104857600,
  'num.partitions', 1,
  'log.flush.interval', 10000,
  'log.default.flush.interval.ms',1000,
  'log.default.flush.scheduler.interval.ms', 1000,
  'log.retention.hours', 168,
  'log.file.size', 536870912,
  'log.cleanup.interval.mins', 1,
  'enable.zookeeper', false
]
