require 'test_helper'

class MultipleParagraphsTest < MiniTest::Unit::TestCase
  include TestHelpers

  def setup
    @formatter = MarkdownEscPos::ToEscPosFormat.new(RDoc::Options.new, nil)
    @expected = <<EOM
This is the first sentence.
There are more in this
paragraph.

Each paragraph is going to be
wrapped at word boundaries and
not exceeding the overall line
length of 32 characters.

In the third paragraph, there
are three sentences. The second
one is rather short. Finally,
that paragraph is over, too.
EOM
  end

  def test_wrapping
    fixture = fixture('multiple_paragraphs.markdown')

    result = to_esc_pos(fixture)
    result_lines = result.lines
    expected_lines = @expected.lines

    @expected.lines.each.with_index do |expected_line, i|
      assert_equal(expected_line, result.lines[i])
    end
  end

private

  def to_esc_pos(io)
    RDoc::Markdown.parse(io).accept(@formatter)
  end
end
