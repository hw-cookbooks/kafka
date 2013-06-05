default[:kafka][:version] = "0.7.2"
default[:kafka][:base_url] = "https://www.apache.org/dist/incubator/kafka/"

default[:kafka][:install_dir] = "/opt/kafka"
default[:kafka][:data_dir] = "/var/kafka"
default[:kafka][:log_dir] = "/var/log/kafka"
default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"

default[:kafka][:auto_discovery] = false
