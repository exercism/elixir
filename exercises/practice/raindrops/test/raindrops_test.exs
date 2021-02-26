defmodule RaindropsTest do
  use ExUnit.Case

  # @tag :pending
  test "1" do
    assert Raindrops.convert(1) == "1"
  end

  @tag :pending
  test "3" do
    assert Raindrops.convert(3) == "Pling"
  end

  @tag :pending
  test "5" do
    assert Raindrops.convert(5) == "Plang"
  end

  @tag :pending
  test "7" do
    assert Raindrops.convert(7) == "Plong"
  end

  @tag :pending
  test "6" do
    assert Raindrops.convert(6) == "Pling"
  end

  @tag :pending
  test "8" do
    assert Raindrops.convert(8) == "8"
  end

  @tag :pending
  test "9" do
    assert Raindrops.convert(9) == "Pling"
  end

  @tag :pending
  test "10" do
    assert Raindrops.convert(10) == "Plang"
  end

  @tag :pending
  test "14" do
    assert Raindrops.convert(14) == "Plong"
  end

  @tag :pending
  test "15" do
    assert Raindrops.convert(15) == "PlingPlang"
  end

  @tag :pending
  test "21" do
    assert Raindrops.convert(21) == "PlingPlong"
  end

  @tag :pending
  test "25" do
    assert Raindrops.convert(25) == "Plang"
  end

  @tag :pending
  test "35" do
    assert Raindrops.convert(35) == "PlangPlong"
  end

  @tag :pending
  test "49" do
    assert Raindrops.convert(49) == "Plong"
  end

  @tag :pending
  test "52" do
    assert Raindrops.convert(52) == "52"
  end

  @tag :pending
  test "105" do
    assert Raindrops.convert(105) == "PlingPlangPlong"
  end

  @tag :pending
  test "12121" do
    assert Raindrops.convert(12121) == "12121"
  end
end
