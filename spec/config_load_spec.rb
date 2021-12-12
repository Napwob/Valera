require_relative '../lib/valera_init'
require_relative '../lib/config_load'
require 'rspec'

describe ConfigLoader do
  let(:valera) { ValeraInit.new }
  subject { ConfigLoader.new(valera, {}) }
  let(:data) { subject.load_configuration }

  describe '#load_configuration' do
    context 'when config file is not empty' do
      it { expect(subject.load_configuration).to_not eq([]) }
    end
  end
end
