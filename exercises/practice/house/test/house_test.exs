defmodule HouseTest do
  use ExUnit.Case

  # @tag :pending
  test "verse one - the house that jack built" do
    start = 1
    stop = 1
    output = House.recite(start, stop)

    expected = """
    This is the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse two - the malt that lay" do
    start = 2
    stop = 2
    output = House.recite(start, stop)

    expected = """
    This is the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse three - the rat that ate" do
    start = 3
    stop = 3
    output = House.recite(start, stop)

    expected = """
    This is the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse four - the cat that killed" do
    start = 4
    stop = 4
    output = House.recite(start, stop)

    expected = """
    This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse five - the dog that worried" do
    start = 5
    stop = 5
    output = House.recite(start, stop)

    expected = """
    This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse six - the cow with the crumpled horn" do
    start = 6
    stop = 6
    output = House.recite(start, stop)

    expected = """
    This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse seven - the maiden all forlorn" do
    start = 7
    stop = 7
    output = House.recite(start, stop)

    expected = """
    This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse eight - the man all tattered and torn" do
    start = 8
    stop = 8
    output = House.recite(start, stop)

    expected = """
    This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse nine - the priest all shaven and shorn" do
    start = 9
    stop = 9
    output = House.recite(start, stop)

    expected = """
    This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse 10 - the rooster that crowed in the morn" do
    start = 10
    stop = 10
    output = House.recite(start, stop)

    expected = """
    This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse 11 - the farmer sowing his corn" do
    start = 11
    stop = 11
    output = House.recite(start, stop)

    expected = """
    This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "verse 12 - the horse and the hound and the horn" do
    start = 12
    stop = 12
    output = House.recite(start, stop)

    expected = """
    This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "multiple verses" do
    start = 4
    stop = 8
    output = House.recite(start, stop)

    expected = """
    This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end

  @tag :pending
  test "full rhyme" do
    start = 1
    stop = 12
    output = House.recite(start, stop)

    expected = """
    This is the house that Jack built.
    This is the malt that lay in the house that Jack built.
    This is the rat that ate the malt that lay in the house that Jack built.
    This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    """

    assert output == expected
  end
end
