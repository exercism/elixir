if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("raindrops.exs")
end

ExUnit.start

defmodule RaindropsTest do
  use ExUnit.Case, async: true

  test "1" do
    assert Raindrops.convert(1) == "1"
  end

  test "3" do
    assert Raindrops.convert(3) == "Pling"
  end

  test "5" do
    assert Raindrops.convert(5) == "Plang"
  end

  test "7" do
    assert Raindrops.convert(7) == "Plong"
  end

  test "6" do
    assert Raindrops.convert(6) == "Pling"
  end

  test "9" do
    assert Raindrops.convert(9) == "Pling"
  end

  test "10" do
    assert Raindrops.convert(10) == "Plang"
  end

  test "14" do
    assert Raindrops.convert(14) == "Plong"
  end

  test "15" do
    assert Raindrops.convert(15) == "PlingPlang"
  end

  test "21" do
    assert Raindrops.convert(21) == "PlingPlong"
  end

  test "25" do
    assert Raindrops.convert(25) == "Plang"
  end

  test "35" do
    assert Raindrops.convert(35) == "PlangPlong"
  end

  test "49" do
    assert Raindrops.convert(49) == "Plong"
  end

  test "52" do
    assert Raindrops.convert(52) == "52"
  end

  test "105" do
    assert Raindrops.convert(105) == "PlingPlangPlong"
  end

  test "12121" do
    assert Raindrops.convert(12121) == "12121"
  end
end
