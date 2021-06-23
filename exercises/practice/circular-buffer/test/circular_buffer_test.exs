defmodule CircularBufferTest do
  use ExUnit.Case

  # @tag :pending
  test "reading empty buffer should fail" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)
    assert CircularBuffer.read(buffer) == {:error, :empty}
  end

  @tag :pending
  test "can read an item just written" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
  end

  @tag :pending
  test "each item may only be read once" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
    assert CircularBuffer.read(buffer) == {:error, :empty}
  end

  @tag :pending
  test "items are read in the order they are written" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.write(buffer, 2) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
    assert CircularBuffer.read(buffer) == {:ok, 2}
  end

  @tag :pending
  test "full buffer can't be written to" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.write(buffer, 2) == {:error, :full}
  end

  @tag :pending
  test "a read frees up capacity for another write" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
    assert CircularBuffer.write(buffer, 2) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 2}
  end

  @tag :pending
  test "read position is maintained even across multiple writes" do
    capacity = 3
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.write(buffer, 2) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
    assert CircularBuffer.write(buffer, 3) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 2}
    assert CircularBuffer.read(buffer) == {:ok, 3}
  end

  @tag :pending
  test "items cleared out of buffer can't be read" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    CircularBuffer.clear(buffer)
    assert CircularBuffer.read(buffer) == {:error, :empty}
  end

  @tag :pending
  test "clear frees up capacity for another write" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    CircularBuffer.clear(buffer)
    assert CircularBuffer.write(buffer, 2) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 2}
  end

  @tag :pending
  test "clear does nothing on empty buffer" do
    capacity = 1
    {:ok, buffer} = CircularBuffer.new(capacity)

    CircularBuffer.clear(buffer)
    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
  end

  @tag :pending
  test "overwrite acts like write on non-full buffer" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    CircularBuffer.overwrite(buffer, 2)
    assert CircularBuffer.read(buffer) == {:ok, 1}
    assert CircularBuffer.read(buffer) == {:ok, 2}
  end

  @tag :pending
  test "overwrite replaces the oldest item on full buffer" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.write(buffer, 2) == :ok
    CircularBuffer.overwrite(buffer, 3)
    assert CircularBuffer.read(buffer) == {:ok, 2}
    assert CircularBuffer.read(buffer) == {:ok, 3}
  end

  @tag :pending
  test "overwrite replaces the oldest item remaining in buffer following a read" do
    capacity = 3
    {:ok, buffer} = CircularBuffer.new(capacity)

    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.write(buffer, 2) == :ok
    assert CircularBuffer.write(buffer, 3) == :ok
    assert CircularBuffer.read(buffer) == {:ok, 1}
    assert CircularBuffer.write(buffer, 4) == :ok
    CircularBuffer.overwrite(buffer, 5)
    assert CircularBuffer.read(buffer) == {:ok, 3}
    assert CircularBuffer.read(buffer) == {:ok, 4}
    assert CircularBuffer.read(buffer) == {:ok, 5}
  end

  @tag :pending
  test "initial clear does not affect wrapping around" do
    capacity = 2
    {:ok, buffer} = CircularBuffer.new(capacity)

    CircularBuffer.clear(buffer)
    assert CircularBuffer.write(buffer, 1) == :ok
    assert CircularBuffer.write(buffer, 2) == :ok
    CircularBuffer.overwrite(buffer, 3)
    CircularBuffer.overwrite(buffer, 4)
    assert CircularBuffer.read(buffer) == {:ok, 3}
    assert CircularBuffer.read(buffer) == {:ok, 4}
    assert CircularBuffer.read(buffer) == {:error, :empty}
  end
end
