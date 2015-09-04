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

# Mapping Markdown Elements to ESC/POS codes

|----------------------------------------|--------------------------------------------------------------------------------------------------------|
| Markdown                               | ESC/POS                                                                                                |
|----------------------------------------|--------------------------------------------------------------------------------------------------------|
| accepting                              | ?                                                                                                      |
| blank_line                             | newline                                                                                                |
| block_quote                            | Whole paragraph indented by two blanks, a bar and another blank                                        |
| document                               | ?                                                                                                      |
| heading                                | ?                                                                                                      |
| heading_1                              | double height + double width + bold                                                                    |
| heading_2                              | double height + double width                                                                           |
| heading_3                              | double height                                                                                          |
| heading_4                              | double width                                                                                           |
| heading_b                              | ?                                                                                                      |
| heading_suppressed_crossref            | ?                                                                                                      |
| list_end_bullet                        | cancel start_*                                                                                         |
| list_end_label                         | cancel start_*                                                                                         |
| list_end_lalpha                        | cancel start_*                                                                                         |
| list_end_note                          | cancel start_*                                                                                         |
| list_end_number                        | cancel start_*                                                                                         |
| list_end_ualpha                        | cancel start_*                                                                                         |
| list_item_end_bullet                   | cancel start_*                                                                                         |
| list_item_end_label                    | cancel start_*                                                                                         |
| list_item_end_lalpha                   | cancel start_*                                                                                         |
| list_item_end_note                     | cancel start_*                                                                                         |
| list_item_end_number                   | cancel start_*                                                                                         |
| list_item_end_ualpha                   | cancel start_*                                                                                         |
| list_item_start_bullet                 | „  * „ (multiply the two leading spaces by the indentation level)                                      |
| list_item_start_label                  | ?                                                                                                      |
| list_item_start_lalpha                 | ?                                                                                                      |
| list_item_start_note                   | ?                                                                                                      |
| list_item_start_note_2                 | ?                                                                                                      |
| list_item_start_note_multi_description | ?                                                                                                      |
| list_item_start_note_multi_label       | ?                                                                                                      |
| list_item_start_number                 | „  n. „ where n is the position in the list (multiply the two leading spaces by the indentation level) |
| list_item_start_ualpha                 | ?                                                                                                      |
| list_nested                            | increase indentation by two spaces                                                                     |
| list_start_bullet                      | set list type to :bullet (not sure if we will need this)                                               |
| list_start_label                       | ?                                                                                                      |
| list_start_lalpha                      | ?                                                                                                      |
| list_start_note                        | ?                                                                                                      |
| list_start_number                      | set list type to :number (not sure if we will need this)                                               |
| list_start_ualpha                      | ?                                                                                                      |
| list_verbatim                          | ?                                                                                                      |
| paragraph                              | text wrapped at word boundaries, no line longer than 32 characters                                     |
| paragraph_b                            | bold?                                                                                                  |
| paragraph_br                           | ?                                                                                                      |
| paragraph_break                        | ?                                                                                                      |
| paragraph_i                            | italics?                                                                                               |
| paragraph_plus                         | ?                                                                                                      |
| paragraph_star                         | ?                                                                                                      |
| paragraph_underscore                   | ?                                                                                                      |
| raw                                    | ?                                                                                                      |
| rule                                   | ?                                                                                                      |
| verbatim                               | ?                                                                                                      |
|----------------------------------------|--------------------------------------------------------------------------------------------------------|

# FAQ

Q: Why not pandoc?

A: Pandoc does not provide the callbacks we need to turn headings etc. into ESC/POS formats (read: I did not know how to do this in Haskell). Otherwise, the text output and wrapping of Pandoc are fine.
