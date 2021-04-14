require './lib/assistant'

describe Assistant do
  describe '#information' do
    it 'check information' do
      test = Assistant.new
      expect(test.information).to include(/\w/)
    end
  end
end
