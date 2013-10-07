::Chef::Node.send(:include, ChefKafka::Helpers)

default[:kafka][:version] = "0.7.2"

default[:kafka][:install_dir] = "/opt/kafka"
default[:kafka][:data_dir] = "/var/kafka"
default[:kafka][:conf_dir] = "/etc/kafka/conf"
default[:kafka][:runtime_dir] = "/tmp"
default[:kafka][:log_dir] = "/var/log/kafka"
default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"
default[:kafka][:build_commands] = []
default[:kafka][:download_url] = nil

default[:kafka][:auto_discovery] = true
