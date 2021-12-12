require_relative '../lib/valera_init'
require 'rspec'

describe ValeraInit do
  let(:valera) { ValeraInit.new(health: health, mana: mana, happiness: happiness, fatigue: fatigue) }
  let(:health) { 0 }
  let(:mana) { 0 }
  let(:happiness) { 0 }  
  let(:fatigue) { 0 }  
  describe '#dead?' do
    subject { valera.dead? }
    context 'when the valera health < 0' do
      let(:health) { -10 }
      it { is_expected.to be true }
    end

    context 'when the valera fatigue > 100' do
      let(:fatigue) { 101 }
      it { is_expected.to be true }
    end

    context 'when the valera fatigue < 0' do
      let(:fatigue) { -10 }
      it { is_expected.to be true }
    end

    context 'when the valera happiness < -15' do
      let(:happiness) { -15 }
      it { is_expected.to be true }
    end

    context 'when the valera happiness > 10' do
      let(:happiness) { 15 }
      it { is_expected.to be true }
    end

    context 'when the valera health > 0' do
      let(:health) { 50 }
      it { is_expected.to be false }
    end

    context 'when the valera mana < 0' do
      let(:mana) { -10 }
      it { is_expected.to be true }
    end
  end

  describe '#mana=' do
    subject { valera.mana }
    let(:mana) { 130 }

    it { expect(subject).to eq(100) }
    it { expect(valera.health).to eq(0) }
  end
end
