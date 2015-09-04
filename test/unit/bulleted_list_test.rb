require 'test_helper'

class BulletedListTest < MiniTest::Unit::TestCase
  include TestHelpers

  def setup
    @formatter = MarkdownEscPos::ToEscPosFormat.new(RDoc::Options.new, nil)
  end

  def test_bulleted_list
    fixture = fixture('bulleted_list.markdown')

    result = to_esc_pos(fixture)

    assert_equal(25, result.lines.size)
    assert_equal('* ', result.lines[4][0..1])

    result.lines.each.with_index do |p, i|
      p = p.chomp # we don't count the newline
      assert(32 >= p.length, "Line #{i} must not be longer than 32 characters, but it has #{p.length} characters")
    end
  end

private

  def to_esc_pos(io)
    RDoc::Markdown.parse(io).accept(@formatter)
  end
end
