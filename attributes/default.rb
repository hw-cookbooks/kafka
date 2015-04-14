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
default[:kafka][:build_commands] = []

default[:kafka][:auto_discovery] = true

default[:kafka][:zk_prefix] = kafka_zk_prefix()

default[:gradle][:url] = "https://services.gradle.org/distributions/gradle-2.3-bin.zip"
default[:gradle][:version] = "2.3"
default[:gradle][:home_dir] = "/usr/local/gradle"

