defmodule LucasNumbersTest do
  use ExUnit.Case

  @tag task_id: 1
  test "generates a sequence of length 1" do
    assert LucasNumbers.generate(1) == [2]
  end

  @tag task_id: 1
  test "generates a sequence of length 2" do
    assert LucasNumbers.generate(2) == [2, 1]
  end

  @tag task_id: 2
  test "generates a sequence of length 3" do
    assert LucasNumbers.generate(3) == [2, 1, 3]
  end

  @tag task_id: 2
  test "generates a sequence of length 4" do
    assert LucasNumbers.generate(4) == [2, 1, 3, 4]
  end

  @tag task_id: 2
  test "generates a sequence of length 5" do
    sequence = [2, 1, 3, 4, 7]

    assert LucasNumbers.generate(5) == sequence
  end

  @tag task_id: 2
  test "generates a sequence of length 6" do
    sequence = [2, 1, 3, 4, 7, 11]

    assert LucasNumbers.generate(6) == sequence
  end

  @tag task_id: 2
  test "generates a sequence of length 7" do
    sequence = [2, 1, 3, 4, 7, 11, 18]

    assert LucasNumbers.generate(7) == sequence
  end

  @tag task_id: 2
  test "generates a sequence of length 8" do
    sequence = [2, 1, 3, 4, 7, 11, 18, 29]

    assert LucasNumbers.generate(8) == sequence
  end

  @tag task_id: 2
  test "generates a sequence of length 9" do
    sequence = [2, 1, 3, 4, 7, 11, 18, 29, 47]

    assert LucasNumbers.generate(9) == sequence
  end

  @tag task_id: 2
  test "generates a sequence of length 10" do
    sequence = [2, 1, 3, 4, 7, 11, 18, 29, 47, 76]

    assert LucasNumbers.generate(10) == sequence
  end

  @tag task_id: 2
  test "generates a sequence of length 25" do
    sequence = [
      2,
      1,
      3,
      4,
      7,
      11,
      18,
      29,
      47,
      76,
      123,
      199,
      322,
      521,
      843,
      1364,
      2207,
      3571,
      5778,
      9349,
      15127,
      24476,
      39603,
      64079,
      103_682
    ]

    assert LucasNumbers.generate(25) == sequence
  end

  @tag task_id: 3
  test "catch incorrect non-integer arguments" do
    assert_raise ArgumentError, "count must be specified as an integer >= 1", fn ->
      LucasNumbers.generate("Hello world!")
    end
  end

  @tag task_id: 3
  test "catch incorrect integer arguments" do
    assert_raise ArgumentError, "count must be specified as an integer >= 1", fn ->
      LucasNumbers.generate(-1)
    end
  end
end
