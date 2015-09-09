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
    assert_equal "\n", @to.res.join
  end

  def accept_list_end_note
    skip
  end

  def accept_rule
    skip
  end

  def accept_list_item_start_bullet
    assert_equal("* ", @to.res.join)
  end

  def accept_document
    skip
  end

  def accept_list_start_number
    skip
  end

  def accept_raw
    skip
  end

  def list_verbatim
    skip
  end

  def accept_heading_b
    skip
  end

  def accept_heading_1
    skip
  end

  def accept_paragraph
    skip
  end

  def accept_list_item_start_note_multi_label
    skip
  end

  def accept_list_end_ualpha
    skip
  end

  def accept_list_item_end_ualpha
    skip
  end

  def accept_list_item_end_number
    skip
  end

  def accept_list_item_start_lalpha
    skip
  end

  def accept_paragraph_break
    skip
  end

  def accept_list_item_start_note_multi_description
    skip
  end

  def accept_list_end_number
    skip
  end

  def accept_list_start_ualpha
    skip
  end

  def accept_list_item_end_label
    skip
  end

  def accept_list_start_note
    skip
  end

  def accept_list_item_end_lalpha
    skip
  end

  def accept_list_end_lalpha
    skip
  end

  def accept_paragraph_i
    skip
  end

  def accept_list_item_start_number
    skip
  end

  def accept_list_item_end_note
    skip
  end

  def accept_verbatim
    skip
  end

  def accept_paragraph_star
    skip
  end

  def end_accepting
    skip
  end

  def accept_paragraph_b
    skip
  end

  def accept_heading_suppressed_crossref
    skip
  end

  def accept_paragraph_plus
    skip
  end

  def accept_list_start_label
    skip
  end

  def accept_list_start_bullet
    assert_empty(@to.res.join)
  end

  def accept_list_item_start_label
    skip
  end

  def accept_list_end_bullet
    assert_equal("", @to.res.join)
  end

  def accept_list_item_start_ualpha
    skip
  end

  def accept_list_item_start_note_2
    skip
  end

  def start_accepting
    skip
  end

  def accept_list_start_lalpha
    skip
  end

  def accept_list_item_start_note
    skip
  end

  def accept_paragraph_underscore
    skip
  end

  def accept_list_end_label
    skip
  end

  def accept_list_item_end_bullet
    assert_equal("* ", @to.res.join)
  end

  def list_nested
    skip
  end

  def accept_block_quote
    assert_equal("| quote\n\n", @to.res.join)
  end

  def accept_heading
    skip
  end

  def accept_heading_2
    skip
  end

  def accept_heading_3
    skip
  end

  def accept_heading_4
    skip
  end

  def accept_paragraph_br
    # This test checks for a br to pass through, so we take it literally
    assert_equal("one<br>two\n\n", @to.res.join)
  end
end
