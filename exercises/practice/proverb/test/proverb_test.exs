defmodule ProverbTest do
  use ExUnit.Case

  # @tag :pending
  test "zero pieces" do
    strings = []
    output = Proverb.recite(strings)
    expected = ""

    assert output == expected
  end

  @tag :pending
  test "one piece" do
    strings = ["nail"]
    output = Proverb.recite(strings)

    expected = """
    And all for the want of a nail.
    """

    assert output == expected
  end

  @tag :pending
  test "two pieces" do
    strings = ["nail", "shoe"]
    output = Proverb.recite(strings)

    expected = """
    For want of a nail the shoe was lost.
    And all for the want of a nail.
    """

    assert output == expected
  end

  @tag :pending
  test "three pieces" do
    strings = ["nail", "shoe", "horse"]
    output = Proverb.recite(strings)

    expected = """
    For want of a nail the shoe was lost.
    For want of a shoe the horse was lost.
    And all for the want of a nail.
    """

    assert output == expected
  end

  @tag :pending
  test "full proverb" do
    strings = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]
    output = Proverb.recite(strings)

    expected = """
    For want of a nail the shoe was lost.
    For want of a shoe the horse was lost.
    For want of a horse the rider was lost.
    For want of a rider the message was lost.
    For want of a message the battle was lost.
    For want of a battle the kingdom was lost.
    And all for the want of a nail.
    """

    assert output == expected
  end

  @tag :pending
  test "four pieces modernized" do
    strings = ["pin", "gun", "soldier", "battle"]
    output = Proverb.recite(strings)

    expected = """
    For want of a pin the gun was lost.
    For want of a gun the soldier was lost.
    For want of a soldier the battle was lost.
    And all for the want of a pin.
    """

    assert output == expected
  end
end
