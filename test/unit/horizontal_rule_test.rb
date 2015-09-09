require 'test_helper'

class HorizontalRuleTest < EscPosTest
  HR = "________________________________\n"

  def test_rule_simple
    fixture = <<EOM
A horizontal rule cannot live without a paragraph.

***

There must be text before and after.
EOM

    result = to_esc_pos(fixture)

    assert_equal(HR, result.lines[3])
  end

  def test_rule_alternative
    fixture = <<EOM
A horizontal rule cannot live without a paragraph.

* * *

There must be text before and after.
EOM

    result = to_esc_pos(fixture)

    assert_equal(HR, result.lines[3])
  end

  def test_rule_complete
    fixture = fixture('horizontal_rule.markdown')

    result = to_esc_pos(fixture)

    assert_length_limit(result)

    (2..26).step(5).each do |i|
      assert_equal(HR, result.lines[i], "Expect line #{i} to be a horizontal rule, but was #{result.lines[i]}")
    end
  end
end
