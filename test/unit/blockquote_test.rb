require 'test_helper'

class BlockQuoteTest < MiniTest::Unit::TestCase
  include TestHelpers

  def setup
    @formatter = MarkdownEscPos::ToEscPosFormat.new(RDoc::Options.new, nil)
  end

  def test_block_quote_wrapping
    fixture = "> This is supposed to be a block-quoted bunch of characters, wrapped at word boundaries and not exceeding the overall line length of 32 characters."

    result = to_esc_pos(fixture)

    result.lines.each do |p|
      p = p.chomp # we don't count the newline
      assert(32 >= p.length, "Line must not be longer than 32 characters, but was #{p.length}")
    end
  end

private

  def to_esc_pos(io)
    RDoc::Markdown.parse(io).accept(@formatter)
  end
end
