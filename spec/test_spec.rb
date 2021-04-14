require './lib/assistant'

describe Assistant do
  describe '#information' do
    it 'check information' do
      test = Assistant.new
      expect(test.information).to match(/\w/)
    end
  end
end
