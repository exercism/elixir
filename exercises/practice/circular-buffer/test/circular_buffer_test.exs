defmodule CircularBufferTest do
  use ExUnit.Case

  def test_operation(buffer, %{"operation" => "read", "should_succeed" => ok} = op) do
    read = CircularBuffer.read(buffer)

    if ok do
      assert {:ok, op["expected"]} == read
    else
      assert {:error, :empty} == read
    end
  end

  def test_operation(buffer, %{"operation" => "write", "item" => item, "should_succeed" => ok}) do
    write = CircularBuffer.write(buffer, item)

    if ok do
      assert :ok == write
    else
      assert {:error, :full} == write
    end
  end

  def test_operation(buffer, %{"operation" => "overwrite", "item" => item}),
    do: CircularBuffer.overwrite(buffer, item)

  def test_operation(buffer, %{"operation" => "clear"}),
    do: CircularBuffer.clear(buffer)

  # @tag :pending
  test "reading empty buffer should fail" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)
    operations = [%{"operation" => "read", "should_succeed" => false}]
    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "can read an item just written" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "each item may only be read once" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true},
      %{"operation" => "read", "should_succeed" => false}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "items are read in the order they are written" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true},
      %{"expected" => 2, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "full buffer can't be written to" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => false}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "a read frees up capacity for another write" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"expected" => 2, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "read position is maintained even across multiple writes" do
    capacity = 3
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true},
      %{"item" => 3, "operation" => "write", "should_succeed" => true},
      %{"expected" => 2, "operation" => "read", "should_succeed" => true},
      %{"expected" => 3, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "items cleared out of buffer can't be read" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"operation" => "clear"},
      %{"operation" => "read", "should_succeed" => false}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "clear frees up capacity for another write" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"operation" => "clear"},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"expected" => 2, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "clear does nothing on empty buffer" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"operation" => "clear"},
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "overwrite acts like write on non-full buffer" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "overwrite"},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true},
      %{"expected" => 2, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "overwrite replaces the oldest item on full buffer" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"item" => 3, "operation" => "overwrite"},
      %{"expected" => 2, "operation" => "read", "should_succeed" => true},
      %{"expected" => 3, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "overwrite replaces the oldest item remaining in buffer following a read" do
    capacity = 3
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"item" => 3, "operation" => "write", "should_succeed" => true},
      %{"expected" => 1, "operation" => "read", "should_succeed" => true},
      %{"item" => 4, "operation" => "write", "should_succeed" => true},
      %{"item" => 5, "operation" => "overwrite"},
      %{"expected" => 3, "operation" => "read", "should_succeed" => true},
      %{"expected" => 4, "operation" => "read", "should_succeed" => true},
      %{"expected" => 5, "operation" => "read", "should_succeed" => true}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end

  @tag :pending
  test "initial clear does not affect wrapping around" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    operations = [
      %{"operation" => "clear"},
      %{"item" => 1, "operation" => "write", "should_succeed" => true},
      %{"item" => 2, "operation" => "write", "should_succeed" => true},
      %{"item" => 3, "operation" => "overwrite"},
      %{"item" => 4, "operation" => "overwrite"},
      %{"expected" => 3, "operation" => "read", "should_succeed" => true},
      %{"expected" => 4, "operation" => "read", "should_succeed" => true},
      %{"operation" => "read", "should_succeed" => false}
    ]

    Enum.each(operations, &test_operation(buffer, &1))
  end
end
