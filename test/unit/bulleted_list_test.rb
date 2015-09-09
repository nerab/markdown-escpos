require 'test_helper'

class BulletedListTest < EscPosTest
  def test_bulleted_list
    fixture = fixture('bulleted_list.markdown')

    result = to_esc_pos(fixture)

    assert_equal('* ', result.lines[4][0..1])
    assert_length_limit(result)
  end
end
