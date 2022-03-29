# frozen_string_literal: true

require_relative '../lib/visit'

RSpec.describe Visit do
  # before do
  #   @visit = build(:visit)
  # end

  context 'when built' do
    it 'has attribute webpage' do
      visit = build(:visit)
      expect(visit).to respond_to(:webpage)
    end

    it 'has the attribute ip' do
      visit = build(:visit)
      expect(visit).to respond_to(:ip)
    end
  end

  context 'when given string ip' do
    it 'accepts it' do
      expect(build(:visit, ip: '192.168.1.1').ip).to eq('192.168.1.1')
    end
  end

  context 'when given none string ip' do
    it 'does not to accept it' do
      expect { build(:visit, ip: 192) }.to raise_error(ValidationError)
    end
  end

  context 'when given correct formatted ip' do
    it 'accepts it' do
      visit = build(:visit, ip: '192.168.1.1')
      expect(visit.ip).to eq('192.168.1.1')
    end
  end

  context 'when given incorrect formatted ip with more than 4 parts' do
    it 'does not accept it' do
      expect { build(:visit, ip: '192.168.1.1.0') }.to raise_error(ValidationError)
    end
  end

  context 'when given incorrect formatted ip with less than 4 parts' do
    it 'does not accept it' do
      expect { build(:visit, ip: '192.168.1') }.to raise_error(ValidationError)
    end
  end

  context 'when given ip with a part of it not between [0-255]' do
    it 'does not accept it' do
      expect { build(:visit, ip: '192.168.1.256') }.to raise_error(ValidationError)
    end
  end

  context 'when given none string webpage' do
    it 'does not accept it' do
      expect { build(:visit, ip: nil) }.to raise_error(ValidationError)
    end
  end

  context 'when given a string webpage' do
    it 'accepts it' do
      visit = build(:visit, webpage: '/home')
      expect(visit.webpage).to eq('/home')
    end
  end

  context 'when given incorrect webpage path' do
    it 'does not accept it' do
      expect { build(:visit, webpage: 'home') }.to raise_error(ValidationError)
    end
  end

  context 'when given correct webpage path' do
    it 'accepts it' do
      visit = build(:visit, webpage: '/pages/1')
      expect(visit.webpage).to eq('/pages/1')
    end
  end
end
