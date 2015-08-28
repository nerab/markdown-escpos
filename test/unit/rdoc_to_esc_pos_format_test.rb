require 'test_helper'

require 'rdoc'
require 'rdoc/markup/formatter_test_case'

class RDocToEscPosFormatTest < RDoc::Markup::FormatterTestCase
  add_visitor_tests

  def setup
    super
    @to = MarkdownEscPos::ToEscPosFormat.new(RDoc::Options.new)
  end

  def accept_blank_line
    assert_equal :junk, @to.res.join
  end
end
