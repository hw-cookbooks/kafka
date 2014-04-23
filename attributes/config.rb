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
