require 'rdoc'

module MarkdownEscPos
  class ToEscPosFormat < RDoc::Markup::Formatter
    include RDoc::Text # helpers like wrap

    LINE_BREAK = "\n"
    INDENT = '  '
    MAX_COLUMNS = 32

    attr_reader :res, :list

    def start_accepting
      @res = []
      @list = []
      @list_stack = []
      @block_quote_stack = []
    end

    def end_accepting
      @res.pop if "\n" == @res.flatten.last[-1]
      @res.join
    end

    def accept_paragraph(paragraph)
      if @block_quote_stack.any?
        prefix = @block_quote_stack.join + ' '
      end

      max_columns = MAX_COLUMNS - @block_quote_stack.size
      wrapped_paragraphs = wrap(paragraph.text, max_columns).split(LINE_BREAK)

      @res << "#{prefix}#{wrapped_paragraphs[0]}#{LINE_BREAK}"

      list_indentation = INDENT * @list_stack.size
      @res << wrapped_paragraphs[1..-1].map{|p| "#{prefix}#{list_indentation}#{p}#{LINE_BREAK}"}

      @res << LINE_BREAK
    end

    def accept_raw raw
      @res << raw.parts.join
    end

    def accept_verbatim(verbatim)
      @res << verbatim.text.gsub(/^(\S)/, INDENT + '\1')
    end

    def accept_list_start(list)
      @list << case list.type
               when :BULLET then
                 '*'
               when :NUMBER then
                 '1'
               else
                 list.type
               end

      @list_stack.push(false)
    end

    def accept_list_end(list)
      @list.pop

      if tag = @list_stack.pop
        @res << tag
      end
    end

    def accept_list_item_start(list_item)
      if tag = @list_stack.last
        @res << tag
      end

      @res << "#{INDENT * (@list.size - 1)}#{@list.last} "
    end

    def accept_list_item_end(list_item)
      @list_stack[-1] = ""
    end

    def accept_blank_line(blank_line)
      @res << LINE_BREAK
    end

    def accept_rule(rule)
      if 1 != rule.weight
        STDERR.puts "Warning: Ignoring rule weight #{rule.weight}"
      end

      @res << "________________________________\n\n"
    end

    def accept_heading(heading)
      @res << send("heading#{heading.level}", heading.text) << LINE_BREAK << LINE_BREAK
    end

    def accept_block_quote(block_quote)
      @block_quote_stack.push('|')

      block_quote.parts.each do |part|
        part.accept(self)
      end

      @block_quote_stack.pop
    end

    def handle_special_HARD_BREAK(special)
      @res << LINE_BREAK
    end

    def handle_special_HYPERLINK(special)
      @res << special.text
    end

    def accept_hard_break(hard_break)
      raise 'Not implemented yet'
    end

    def accept_indented_paragraph(paragraph)
      raise 'Not implemented yet'
    end

  private

    def heading1(text)
      "<h1>#{text}</h1>"
    end

    def heading2(text)
      "<h2>#{text}</h2>"
    end

    def heading3(text)
      "<h3>#{text}</h3>"
    end

    def heading4(text)
      "<h4>#{text}</h4>"
    end

    def heading5(text)
      "<h5>#{text}</h5>"
    end
  end
end
