require "rdoc"

module MarkdownEscPos
  class ToEscPosFormat < RDoc::Markup::Formatter
    include RDoc::Text # helpers like wrap

    attr_reader :res, :list

    def start_accepting
      @res = []
      @list = []
      @list_stack = []
      @block_quote_stack = []
    end

    def end_accepting
      @res.join
    end

    def accept_paragraph(paragraph)
      if @block_quote_stack.any?
        prefix = @block_quote_stack.join + ' '
      end

      # TODO 32 - length of indentation
      wrapped_paragraphs = wrap(paragraph.text, 29).split("\n")

      @res << "#{prefix}#{wrapped_paragraphs[0]}\n"

      indentation = '  ' * @list_stack.size
      @res << wrapped_paragraphs[1..-1].map{|p| "#{prefix}#{indentation}#{p}\n"}
    end

    def accept_raw raw
      @res << raw.parts.join
    end

    def accept_verbatim(verbatim)
      @res << verbatim.text.gsub(/^(\S)/, '  \1')
    end

    def accept_list_start(list)
      @res << "\n"
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

      @res << "\n"
    end

    def accept_list_item_start(list_item)
      if tag = @list_stack.last
        @res << tag
      end

      @res << "#{'  ' * (@list.size - 1)}#{@list.last} "
    end

    def accept_list_item_end(list_item)
      @list_stack[-1] = ""
    end

    def accept_blank_line(blank_line)
      @res << "\n"
    end

    def accept_rule(rule)
      @res << '-' * rule.weight
    end

    def accept_heading(heading)
      @res << send("heading#{heading.level}", heading.text) << "\n\n"
    end

    def accept_block_quote(block_quote)
      @res << "\n"
      @block_quote_stack.push('|')

      block_quote.parts.each do |part|
        part.accept(self)
      end

      @res << "\n"
      @block_quote_stack.pop
    end

    def handle_special_HARD_BREAK special
      @res << "\n"
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
