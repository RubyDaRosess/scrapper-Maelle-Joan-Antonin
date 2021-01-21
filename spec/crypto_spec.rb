require_relative '../lib/dark_trader'

describe 'Crypto fonction' do
    it 'Crypto should display an array without nil.' do
      expect(crypto_scrap.is_a?(Array)).to eq true
      expect(crypto_scrap.all? { |elem| elem.class == Hash }).to be true
    end
    it 'Crypto must have string keys Bitcoin and Ethereum.' do
      expect(crypto_scrap[0].key?('Bitcoin')).to eq true
      expect(crypto_scrap[1].key?('Ethereum')).to eq true
    end
    it 'Crypto must have 200 elements.' do
      expect(crypto_scrap.count).to eq(200)
    end
  end

describe 