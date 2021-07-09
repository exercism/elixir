defmodule ReactTest do
  use ExUnit.Case

  def send_callback(pid),
    do: fn name, value -> send(pid, {:callback, name, value}) end

  # @tag :pending
  test "input cells have a value" do
    {:ok, cells} = React.new([{:input, "input", 10}])
    assert React.get_value(cells, "input") == 10
  end

  @tag :pending
  test "an input cell's value can be set" do
    {:ok, cells} = React.new([{:input, "input", 4}])

    React.set_value(cells, "input", 20)
    assert React.get_value(cells, "input") == 20
  end

  @tag :pending
  test "compute cells calculate initial value" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "output", ["input"], fn a -> a + 1 end}
      ])

    assert React.get_value(cells, "output") == 2
  end

  @tag :pending
  test "compute cells calculate values with booleans and strings" do
    {:ok, cells} =
      React.new([
        {:input, "true", true},
        {:input, "value", "value"},
        {:output, "output", ["true", "value"], fn a, b -> if(a, do: b, else: "failure") end}
      ])

    assert React.get_value(cells, "output") == "value"
  end

  @tag :pending
  test "compute cells take inputs in the right order" do
    {:ok, cells} =
      React.new([
        {:input, "one", 1},
        {:input, "two", 2},
        {:output, "output", ["one", "two"], fn a, b -> a + b * 10 end}
      ])

    assert React.get_value(cells, "output") == 21
  end

  @tag :pending
  test "compute cells update value when dependencies are changed" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "output", ["input"], fn a -> a + 1 end}
      ])

    React.set_value(cells, "input", 3)
    assert React.get_value(cells, "output") == 4
  end

  @tag :pending
  test "compute cells can depend on other compute cells" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "times_two", ["input"], fn a -> a * 2 end},
        {:output, "times_thirty", ["input"], fn a -> a * 30 end},
        {:output, "output", ["times_two", "times_thirty"], fn a, b -> a + b end}
      ])

    assert React.get_value(cells, "output") == 32
    React.set_value(cells, "input", 3)
    assert React.get_value(cells, "output") == 96
  end

  @tag :pending
  test "compute cells fire callbacks" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "output", ["input"], fn a -> a + 1 end}
      ])

    myself = self()
    React.add_callback(cells, "output", "callback1", send_callback(myself))
    React.set_value(cells, "input", 3)
    assert_receive {:callback, "callback1", 4}
  end

  @tag :pending
  test "callback cells only fire on change" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "output", ["input"], fn a -> if(a < 3, do: 111, else: 222) end}
      ])

    myself = self()
    React.add_callback(cells, "output", "callback1", send_callback(myself))
    React.set_value(cells, "input", 2)
    refute_receive {:callback, _}, 50, "Expected no callback"
    React.set_value(cells, "input", 4)
    assert_receive {:callback, "callback1", 222}
  end

  @tag :pending
  test "callbacks do not report already reported values" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "output", ["input"], fn a -> a + 1 end}
      ])

    myself = self()
    React.add_callback(cells, "output", "callback1", send_callback(myself))
    React.set_value(cells, "input", 2)
    assert_receive {:callback, "callback1", 3}
    React.set_value(cells, "input", 3)
    assert_receive {:callback, "callback1", 4}
  end

  @tag :pending
  test "callbacks can fire from multiple cells" do
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "plus_one", ["input"], fn a -> a + 1 end},
        {:output, "minus_one", ["input"], fn a -> a - 1 end}
      ])

    myself = self()
    React.add_callback(cells, "plus_one", "callback1", send_callback(myself))
    React.add_callback(cells, "minus_one", "callback2", send_callback(myself))
    React.set_value(cells, "input", 10)
    assert_receive {:callback, "callback1", 11}
    assert_receive {:callback, "callback2", 9}
  end

  @tag :pending
  test "callbacks can be added and removed" do
    {:ok, cells} =
      React.new([
        {:input, "input", 11},
        {:output, "output", ["input"], fn a -> a + 1 end}
      ])

    myself = self()
    React.add_callback(cells, "output", "callback1", send_callback(myself))
    React.add_callback(cells, "output", "callback2", send_callback(myself))
    React.set_value(cells, "input", 31)
    assert_receive {:callback, "callback1", 32}
    assert_receive {:callback, "callback2", 32}
    React.remove_callback(cells, "output", "callback1")

    React.add_callback(cells, "output", "callback3", send_callback(myself))
    React.set_value(cells, "input", 41)
    refute_receive {:callback, _}, 50, "Expected no callback"
    assert_receive {:callback, "callback2", 42}
    assert_receive {:callback, "callback3", 42}
  end

  @tag :pending
  test "removing a callback multiple times doesn't interfere with other callbacks" do
    # Some incorrect implementations store their callbacks in an array
    # and removing a callback repeatedly either removes an unrelated callback
    # or causes an out of bounds access.
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "output", ["input"], fn a -> a + 1 end}
      ])

    myself = self()
    React.add_callback(cells, "output", "callback1", send_callback(myself))
    React.add_callback(cells, "output", "callback2", send_callback(myself))
    React.remove_callback(cells, "output", "callback1")
    React.remove_callback(cells, "output", "callback1")
    React.remove_callback(cells, "output", "callback1")
    React.set_value(cells, "input", 2)
    refute_receive {:callback, _}, 50, "Expected no callback"
    assert_receive {:callback, "callback2", 3}
  end

  @tag :pending
  test "callbacks should only be called once even if multiple dependencies change" do
    # Some incorrect implementations call a callback function too early,
    # when not all of the inputs of a compute cell have propagated new values.
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "plus_one", ["input"], fn a -> a + 1 end},
        {:output, "minus_one1", ["input"], fn a -> a - 1 end},
        {:output, "minus_one2", ["minus_one1"], fn a -> a - 1 end},
        {:output, "output", ["plus_one", "minus_one2"], fn a, b -> a * b end}
      ])

    myself = self()
    React.add_callback(cells, "output", "callback1", send_callback(myself))
    React.set_value(cells, "input", 4)
    assert_receive {:callback, "callback1", 10}
  end

  @tag :pending
  test "callbacks should not be called if dependencies change but output value doesn't change" do
    # Some incorrect implementations simply mark a compute cell as dirty when a dependency changes,
    # then call callbacks on all dirty cells.
    # This is incorrect since the specification indicates only to call callbacks on change.
    {:ok, cells} =
      React.new([
        {:input, "input", 1},
        {:output, "plus_one", ["input"], fn a -> a + 1 end},
        {:output, "minus_one", ["input"], fn a -> a - 1 end},
        {:output, "always_two", ["plus_one", "minus_one"], fn a, b -> a - b end}
      ])

    myself = self()
    React.add_callback(cells, "always_two", "callback1", send_callback(myself))
    React.set_value(cells, "input", 2)
    refute_receive {:callback, _}, 50, "Expected no callback"
    React.set_value(cells, "input", 3)
    refute_receive {:callback, _}, 50, "Expected no callback"
    React.set_value(cells, "input", 4)
    refute_receive {:callback, _}, 50, "Expected no callback"
    React.set_value(cells, "input", 5)
    refute_receive {:callback, _}, 50, "Expected no callback"
  end
end
