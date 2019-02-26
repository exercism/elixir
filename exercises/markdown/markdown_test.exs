if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("markdown.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule MarkdownTest do
  use ExUnit.Case

  # @tag :pending
  test "parses normal text as a paragraph" do
    input = "This will be a paragraph"
    expected = "<p>This will be a paragraph</p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "parsing italics" do
    input = "_This will be italic_"
    expected = "<p><em>This will be italic</em></p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "parsing bold text" do
    input = "__This will be bold__"
    expected = "<p><strong>This will be bold</strong></p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "parsing text with left-flanking" do
    input = "_This will be a paragraph"
    expected = "<p>_This will be a paragraph</p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "parsing text with right-flanking" do
    input = "This will be a paragraph_"
    expected = "<p>This will be a paragraph_</p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "mixed normal, italics and bold text" do
    input = "This will _be_ __mixed__"
    expected = "<p>This will <em>be</em> <strong>mixed</strong></p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "with h1 header level" do
    input = "# This will be an h1"
    expected = "<h1>This will be an h1</h1>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "with h2 header level" do
    input = "## This will be an h2"
    expected = "<h2>This will be an h2</h2>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "with h6 header level" do
    input = "###### This will be an h6"
    expected = "<h6>This will be an h6</h6>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "parsing text with left-flanking" do
    input = "##This is not a header"
    expected = "<p>##This is not a header</p>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "unordered lists" do
    input = "* Item 1\n* Item 2"
    expected = "<ul><li>Item 1</li><li>Item 2</li></ul>"
    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "with a little bit of everything" do
    input = "# Header!\n* __Bold Item__\n* _Italic Item_"

    expected =
      "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>"

    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "several lists separated by a paragraph" do
    input =
      "* L1_1\n* L1_2\n\nA simple paragraph\n\n* L2_1\n* L2_2"

    expected =
      "<ul><li>L1_1</li><li>L1_2</li></ul><p>A simple paragraph</p><ul><li>L2_1</li><li>L2_2</li></ul></div></div>"

    assert Markdown.parse(input) == expected
  end

  @tag :pending
  test "parsing text with neither left nor right-flanking" do
    input = "__ This will not be bold __"
    expected = "<p>__ This will not be bold __</p>"
    assert Markdown.parse(input) == expected
  end
end
