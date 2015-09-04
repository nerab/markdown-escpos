$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'markdown-escpos'

module TestHelpers
  def fixture(name = name)
    File.new(File.join(File.dirname(__FILE__), 'fixtures', name)).read
  end
end
