require_relative './spec_helper'

describe 'Kafka Broker' do
  it 'is listening on port 9092' do
    expect(port(9092)).to be_listening
  end

  context 'for a topic' do
    let(:bindir) { '/opt/kafka/kafka/bin' }
    let(:topic) { '--topic test' }
    let(:message) { 'message' }
    let(:zk) { '--zookeeper 127.0.0.1:2181' }

    it 'can produce messages' do
      producer = IO.popen("#{bindir}/kafka-console-producer.sh #{zk} #{topic} >/dev/null", 'w')
      producer.puts message
      # closing this pipe seems to block forever, so we'll skip it even
      # though this is terrible systems programming in general ;)

      # no exception should have been raised
    end

    it 'can consume messages' do
      sleep 3
      consumer = IO.popen("#{bindir}/kafka-console-consumer.sh #{zk} #{topic} --from-beginning --max-messages 1 2>/dev/null", 'r')
      expect(consumer.gets).to eq("#{message}\n")
      # closing this pipe seems to block forever, so we'll skip it even
      # though this is terrible systems programming in general ;)
    end
  end
end
