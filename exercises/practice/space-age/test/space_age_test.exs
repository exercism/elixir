defmodule SpaceAgeTest do
  use ExUnit.Case

  # @tag :pending
  test "age on Earth" do
    input = 1_000_000_000
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 31.69, age, 0.005
  end

  @tag :pending
  test "age on Mercury" do
    input = 2_134_835_688
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 67.65, age, 0.005
    {:ok, age} = SpaceAge.age_on(:mercury, input)
    assert_in_delta 280.88, age, 0.005
  end

  @tag :pending
  test "age on Venus" do
    input = 189_839_836
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 6.02, age, 0.005
    {:ok, age} = SpaceAge.age_on(:venus, input)
    assert_in_delta 9.78, age, 0.005
  end

  @tag :pending
  test "age on Mars" do
    input = 2_129_871_239
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 67.49, age, 0.005
    {:ok, age} = SpaceAge.age_on(:mars, input)
    assert_in_delta 35.88, age, 0.005
  end

  @tag :pending
  test "age on Jupiter" do
    input = 901_876_382
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 28.58, age, 0.005
    {:ok, age} = SpaceAge.age_on(:jupiter, input)
    assert_in_delta 2.41, age, 0.005
  end

  @tag :pending
  test "age on Saturn" do
    input = 2_000_000_000
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 63.38, age, 0.005
    {:ok, age} = SpaceAge.age_on(:saturn, input)
    assert_in_delta 2.15, age, 0.005
  end

  @tag :pending
  test "age on Uranus" do
    input = 1_210_123_456
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 38.35, age, 0.005
    {:ok, age} = SpaceAge.age_on(:uranus, input)
    assert_in_delta 0.46, age, 0.005
  end

  @tag :pending
  test "age on Neptune" do
    input = 1_821_023_456
    {:ok, age} = SpaceAge.age_on(:earth, input)
    assert_in_delta 57.70, age, 0.005
    {:ok, age} = SpaceAge.age_on(:neptune, input)
    assert_in_delta 0.35, age, 0.005
  end

  @tag :pending
  test "invalid planet causes error" do
    input = 680_804_807
    assert SpaceAge.age_on(:sun, input) == {:error, "not a planet"}
  end
end
