# eposdown - A Markdown to ESC/POS converter

This tool converts markdown to ESC/POS codes, so that you can write a receipe in a near-markdown syntax.

Regular text is wrapped by piping the payload (minus markup) through `fold -sw 32` in order to wrap at spaces before reaching beyond 32 characters.

# ESC/POS-supported commands

  * text*
  * double height
  * double width
  * underlined
  * font A
  * font B
  * inverse
  * alignment-left
  * alignment-center
  * alignment-right
  * newline

# Markdown Elements

