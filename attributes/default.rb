::Chef::Node.send(:include, ChefKafka::Helpers)

default[:kafka][:version] = "0.7.2"
default[:kafka][:download_url] = kafka_download_url(node[:kafka][:version])

default[:kafka][:install_dir] = "/opt/kafka"
default[:kafka][:data_dir] = "/var/kafka"
default[:kafka][:conf_dir] = "/etc/kafka/conf"
default[:kafka][:runtime_dir] = "/tmp"
default[:kafka][:log_dir] = "/var/log/kafka"
default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"
default[:kafka][:build_commands] = []

default[:kafka][:auto_discovery] = true

default[:kafka][:zk_prefix] = kafka_zk_prefix()
