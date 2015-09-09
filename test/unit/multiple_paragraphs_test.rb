require 'test_helper'

class MultipleParagraphsTest < EscPosTest

  def setup
    super
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
    assert_length_limit(result)

    result_lines = result.lines
    expected_lines = @expected.lines

    @expected.lines.each.with_index do |expected_line, i|
      assert_equal(expected_line, result.lines[i])
    end
  end
end
