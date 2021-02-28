defmodule SpaceAgeTest do
  use ExUnit.Case

  # @tag :pending
  test "age on Earth" do
    input = 1_000_000_000
    assert_in_delta 31.69, SpaceAge.age_on(:earth, input), 0.005
  end

  @tag :pending
  test "age on Mercury" do
    input = 2_134_835_688
    assert_in_delta 67.65, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 280.88, SpaceAge.age_on(:mercury, input), 0.005
  end

  @tag :pending
  test "age on Venus" do
    input = 189_839_836
    assert_in_delta 6.02, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 9.78, SpaceAge.age_on(:venus, input), 0.005
  end

  @tag :pending
  test "age on Mars" do
    input = 2_129_871_239
    assert_in_delta 67.49, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 35.88, SpaceAge.age_on(:mars, input), 0.005
  end

  @tag :pending
  test "age on Jupiter" do
    input = 901_876_382
    assert_in_delta 28.58, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 2.41, SpaceAge.age_on(:jupiter, input), 0.005
  end

  @tag :pending
  test "age on Saturn" do
    input = 2_000_000_000
    assert_in_delta 63.38, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 2.15, SpaceAge.age_on(:saturn, input), 0.005
  end

  @tag :pending
  test "age on Uranus" do
    input = 1_210_123_456
    assert_in_delta 38.35, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 0.46, SpaceAge.age_on(:uranus, input), 0.005
  end

  @tag :pending
  test "age on Neptune" do
    input = 1_821_023_456
    assert_in_delta 57.70, SpaceAge.age_on(:earth, input), 0.005
    assert_in_delta 0.35, SpaceAge.age_on(:neptune, input), 0.005
  end
end
