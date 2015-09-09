$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'markdown-escpos'

module TestHelpers
  def fixture(name = name)
    File.new(File.join(File.dirname(__FILE__), 'fixtures', name)).read
  end

  def assert_length_limit(result)
    result.lines.each do |p|
      p = p.chomp # we don't count the newline
      assert(32 >= p.length, "Line must not be longer than 32 characters, but was #{p.length}")
    end
  end
end

class EscPosTest < MiniTest::Unit::TestCase
  include TestHelpers

  def setup
    @formatter = MarkdownEscPos::ToEscPosFormat.new(RDoc::Options.new, nil)
  end

  def to_esc_pos(io)
    RDoc::Markdown.parse(io).accept(@formatter)
  end
end
