module ChefKafka

  module Helpers

    def kafka_download_url(version)
      uri = nil

      if kafka_is_07?
        uri = URI.parse("http://archive.apache.org")
        uri.path = %W{
          /dist/kafka/old_releases
          kafka-#{version}-incubating
          kafka-#{version}-incubating-src.tgz
        }.join("/")
      else
        uri = URI.parse("https://archive.apache.org")
        uri.path = %W{
          /dist/kafka
          #{version}
          kafka-#{version}-src.tgz
        }.join("/")
      end

      uri.to_s
    end

    def kafka_file(uri)
      Pathname.new(URI.parse(uri).path).basename.to_s
    end

    def kafka_suffix_cwd(uri)
      kafka_file(uri).sub(File.extname(kafka_file(uri)), '')
    end

    # Determines whether or not the desired version is equal or less then a
    # 0.7.x release.
    #
    # @return [TrueClass, FalseClass] whether or not the version is equal or
    #   less than 0.7.x
    def kafka_is_07?
      bits = node[:kafka][:version].split('.')
      bits[0].to_i == 0 && bits[1].to_i <= 7
    end

    # version 0.8.1 and above uses gradle to build 0.8.0 and lower use sbt
    # this checks valid version for setting up build_commands
    def kafka_is_081?
      bits = node[:kafka][:version].split('.')
      bits[0].to_i == 0 && bits[1].to_i >= 8 && bits[2].to_i > 0 && bits[2].to_i < 2
    end

    # version 0.8.2 and above does not ship gradle
    def kafka_is_082?
      bits = node[:kafka][:version].split('.')
      bits[0].to_i == 0 && bits[1].to_i >= 8 && bits[2].to_i >= 2
    end

    # Returns the correct ZooKeeper prefix key name based on the desired
    # version of Kafka.
    #
    # @return [String] the correct ZooKeeper prefix name
    def kafka_zk_prefix
      kafka_is_07? ? "zk" : "zookeeper"
    end

    # Returns the correct broker key name based on the desired version of
    # Kafka.
    #
    # @return [String] the correct broker key name
    def kafka_broker_key
      kafka_is_07? ? "brokerid" : "broker.id"
    end

    # Calculates a new broker id that won't overflow a Java Integer.
    #
    # @return [Integer] a new broker id
    def new_kafka_broker_id
      int_bit = kafka_is_07? ? 15 : 31
      max_java_integer = (2 ** int_bit) - 1
      %x{hostid}.to_i(16) % max_java_integer
    end
  end
end
