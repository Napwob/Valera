require_relative '../lib/game'
require_relative '../lib/io_adapter'
require 'rspec'

RSpec.describe Game do
  let(:adapter) { double 'IOAdapter' }
  let(:valera) { ValeraInit.new }
  subject { ConfigLoader.new(valera, {}) }
  let(:data) { subject.load_configuration }
  let(:game) { Game.new(valera, data) }

  before do
    allow(adapter).to receive(:output)
    allow(IOAdapter).to receive(:instance).and_return(adapter)
  end

  describe '#after_loose_input?' do
    before { allow(adapter).to receive(:input).and_return(value) }

    context 'when new game after loose' do
      let(:value) { 'new game' }
      it { expect(game.after_death_menu).to be_truthy }
    end
    context 'when load after loose' do
      let(:value) { 'load' }
      it { expect(game.after_death_menu).to be_truthy }
    end
    
  end
end
