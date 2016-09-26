if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("raindrops.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule RaindropsTest do
  use ExUnit.Case

  # @tag :skip
  test "1" do
    assert Raindrops.convert(1) == "1"
  end

  @tag :skip
  test "3" do
    assert Raindrops.convert(3) == "Pling"
  end

  @tag :skip
  test "5" do
    assert Raindrops.convert(5) == "Plang"
  end

  @tag :skip
  test "7" do
    assert Raindrops.convert(7) == "Plong"
  end

  @tag :skip
  test "6" do
    assert Raindrops.convert(6) == "Pling"
  end

  @tag :skip
  test "9" do
    assert Raindrops.convert(9) == "Pling"
  end

  @tag :skip
  test "10" do
    assert Raindrops.convert(10) == "Plang"
  end

  @tag :skip
  test "14" do
    assert Raindrops.convert(14) == "Plong"
  end

  @tag :skip
  test "15" do
    assert Raindrops.convert(15) == "PlingPlang"
  end

  @tag :skip
  test "21" do
    assert Raindrops.convert(21) == "PlingPlong"
  end

  @tag :skip
  test "25" do
    assert Raindrops.convert(25) == "Plang"
  end

  @tag :skip
  test "35" do
    assert Raindrops.convert(35) == "PlangPlong"
  end

  @tag :skip
  test "49" do
    assert Raindrops.convert(49) == "Plong"
  end

  @tag :skip
  test "52" do
    assert Raindrops.convert(52) == "52"
  end

  @tag :skip
  test "105" do
    assert Raindrops.convert(105) == "PlingPlangPlong"
  end

  @tag :skip
  test "12121" do
    assert Raindrops.convert(12121) == "12121"
  end
end
