require './lib/assistant'
require './lib/google_translate'
describe Assistant do
  let(:test) { Assistant.new }
  describe '#information' do
    it 'check information' do
      expect(test.information).to include(/\w/)
    end
  end
  describe '#translate' do
    it 'check translate' do
      expect(test.translate('hello')).to eql('Hallo')
    end
  end
end
describe Translate do
  let(:test) { Translate.new }
  describe '#to_german' do
    it 'check to_geramn function' do
      expect(test.to_german('hello')).to eql('Hallo')
    end
  end
end
