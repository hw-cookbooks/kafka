module ChefKafka

  module Helpers

    # Determines whether or not the desired version is equal or less then a
    # 0.7.x release.
    #
    # @return [TrueClass, FalseClass] whether or not the version is equal or
    #   less than 0.7.x
    def kafka_is_below_07?
      bits = node[:kafka][:version].split('.')
      Chef::Log.warn("#kafka_is_below_07? gives: #{bits.inspect}")
      bits[0].to_i == 0 && bits[1].to_i <= 7
    end

    def kafka_zk_prefix
      r = kafka_is_below_07? ? "zk" : "zookeeper"
      Chef::Log.warn("#kafka_zk_prefix gives: #{r.inspect}")
      r
    end

    def kafka_broker_key
      r = kafka_is_below_07? ? "brokerid" : "broker.id"
      Chef::Log.warn("#kafka_broker_key gives: #{r.inspect}")
      r
    end

    # Calculates a new broker id that won't overflow a Java Integer.
    #
    # @return [Integer] a new broker id
    def new_kafka_broker_id
      max_java_integer = (2 ** 31) - 1
      %x{hostid}.to_i(16) % max_java_integer
    end
  end
end
