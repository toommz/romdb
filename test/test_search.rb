require 'minitest/autorun'
require 'romdb'

class ROMDbTest < Minitest::Test
  def test_param_escaping
    search = ROMDb::Search.new.title('Silence of')
    assert_equal 't=Silence+of&', search.instance_variable_get(:@request)
  end

  def test_param_add
    search = ROMDb::Search.new.title('Blade Runner').year('1982').type('movie')
    assert_equal 't=Blade+Runner&y=1982&type=movie&',
                 search.instance_variable_get(:@request)
  end

  def test_where
    search = ROMDb::Search.new.where(title: 'Blade Runner', year: '1982', type: 'movie')
    assert_equal 't=Blade+Runner&y=1982&type=movie&',
                 search.instance_variable_get(:@request)
  end
end
