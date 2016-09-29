require 'romdb'

describe ROMDb::Search do
  it 'escapes characters' do
    search = ROMDb::Search.new.title('Silence of')
    expect(search.instance_variable_get(:@request)).to eql('t=Silence+of&')
  end

  it 'adds params to request' do
    search = ROMDb::Search.new.title('Blade Runner').year('1982').type('movie')
    expect(search.instance_variable_get(:@request))
      .to eql('t=Blade+Runner&y=1982&type=movie&')
  end

  it 'add params to request using where' do
    search = ROMDb::Search.new.where(title: 'Blade Runner',
                                     year: '1982',
                                     type: 'movie')
    expect(search.instance_variable_get(:@request))
      .to eql('t=Blade+Runner&y=1982&type=movie&')
  end

  it 'accepts boolean values' do
    search = ROMDb::Search.new.where(title: 'Blade Runner', tomatoes: true)
    expect(search.instance_variable_get(:@request))
      .to eql('t=Blade+Runner&tomatoes=true&')
  end
end
