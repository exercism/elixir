defmodule TwoBucketTest do
  use ExUnit.Case

  # @tag :pending
  test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one" do
    bucket_one = 3
    bucket_two = 5
    goal = 1
    start_bucket = :one
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :one, moves: 4, other_bucket: 5}}

    assert output == expected
  end

  @tag :pending
  test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two" do
    bucket_one = 3
    bucket_two = 5
    goal = 1
    start_bucket = :two
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :two, moves: 8, other_bucket: 3}}

    assert output == expected
  end

  @tag :pending
  test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one" do
    bucket_one = 7
    bucket_two = 11
    goal = 2
    start_bucket = :one
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :one, moves: 14, other_bucket: 11}}

    assert output == expected
  end

  @tag :pending
  test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two" do
    bucket_one = 7
    bucket_two = 11
    goal = 2
    start_bucket = :two
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :two, moves: 18, other_bucket: 7}}

    assert output == expected
  end

  @tag :pending
  test "Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two" do
    bucket_one = 1
    bucket_two = 3
    goal = 3
    start_bucket = :two
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :two, moves: 1, other_bucket: 0}}

    assert output == expected
  end

  @tag :pending
  test "Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two" do
    bucket_one = 2
    bucket_two = 3
    goal = 3
    start_bucket = :one
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :two, moves: 2, other_bucket: 2}}

    assert output == expected
  end

  @tag :pending
  test "Not possible to reach the goal" do
    bucket_one = 6
    bucket_two = 15
    goal = 5
    start_bucket = :one
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:error, :impossible}

    assert output == expected
  end

  @tag :pending
  test "With the same buckets but a different goal, then it is possible" do
    bucket_one = 6
    bucket_two = 15
    goal = 9
    start_bucket = :one
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:ok, %TwoBucket{goal: :two, moves: 10, other_bucket: 0}}

    assert output == expected
  end

  @tag :pending
  test "Goal larger than both buckets is impossible" do
    bucket_one = 5
    bucket_two = 7
    goal = 8
    start_bucket = :one
    output = TwoBucket.measure(bucket_one, bucket_two, goal, start_bucket)
    expected = {:error, :impossible}

    assert output == expected
  end
end
