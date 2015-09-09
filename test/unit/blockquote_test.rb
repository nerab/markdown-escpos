require 'test_helper'

class BlockQuoteTest < EscPosTest
  def test_block_quote_nesting_level_1
    fixture = "> a b c d e f g h i j k l m n o p q r s t u v w x y z"

    result = to_esc_pos(fixture)

    assert_equal(2, result.lines.size)
    assert_equal("| a b c d e f g h i j k l m n o\n", result.lines[0])
    assert_equal("| p q r s t u v w x y z\n", result.lines[1])
  end

  def test_block_quote_nesting_level_2
    fixture = ">> a b c d e f g h i j k l m n o p q r s t u v w x y z"

    result = to_esc_pos(fixture)

    assert_equal(2, result.lines.size)
    assert_equal("|| a b c d e f g h i j k l m n o\n", result.lines[0])
    assert_equal("|| p q r s t u v w x y z\n", result.lines[1])
  end

  def test_block_quote_nesting_level_3
    fixture = ">>> a b c d e f g h i j k l m n o p q r s t u v w x y z"

    result = to_esc_pos(fixture)

    assert_equal(2, result.lines.size)
    assert_equal("||| a b c d e f g h i j k l m n\n", result.lines[0])
    assert_equal("||| o p q r s t u v w x y z\n", result.lines[1])
  end

  def test_block_quote_multiline_wrapping
    fixture = "> This is supposed to be a block-quoted bunch of characters, wrapped at word boundaries and not exceeding the overall line length of 32 characters."

    assert_length_limit(to_esc_pos(fixture))
  end
end
