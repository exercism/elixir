defmodule KitchenCalculatorTest do
  use ExUnit.Case

  describe "get volume from tuple pair" do
    # @tag :pending
    test "get cups" do
      assert KitchenCalculator.get_volume({:cup, 1}) == 1
    end

    @tag :pending
    test "get fluid ounces" do
      assert KitchenCalculator.get_volume({:fluid_ounce, 2}) == 2
    end

    @tag :pending
    test "get teaspoons" do
      assert KitchenCalculator.get_volume({:teaspoons, 3}) == 3
    end

    @tag :pending
    test "get tablespoons" do
      assert KitchenCalculator.get_volume({:tablespoons, 4}) == 4
    end

    @tag :pending
    test "get millilitres" do
      assert KitchenCalculator.get_volume({:millilitre, 5}) == 5
    end
  end

  describe "convert to millilitres from" do
    @tag :pending
    test "millilitres" do
      assert KitchenCalculator.to_millilitre({:millilitre, 3}) == {:millilitre, 3}
    end

    @tag :pending
    test "cups" do
      assert KitchenCalculator.to_millilitre({:cup, 3}) == {:millilitre, 720}
    end

    @tag :pending
    test "fluid ounces" do
      assert KitchenCalculator.to_millilitre({:fluid_ounce, 100}) == {:millilitre, 3000}
    end

    @tag :pending
    test "teaspoon" do
      assert KitchenCalculator.to_millilitre({:teaspoon, 3}) == {:millilitre, 15}
    end

    @tag :pending
    test "tablespoon" do
      assert KitchenCalculator.to_millilitre({:tablespoon, 3}) == {:millilitre, 45}
    end
  end

  describe "convert from millilitres to" do
    @tag :pending
    test "millilitres" do
      assert KitchenCalculator.from_millilitre({:millilitre, 4}, :millilitre) == {:millilitre, 4}
    end

    @tag :pending
    test "cups" do
      assert KitchenCalculator.from_millilitre({:millilitre, 840}, :cup) == {:cup, 3.5}
    end

    @tag :pending
    test "fluid ounces" do
      assert KitchenCalculator.from_millilitre({:millilitre, 4522.5}, :fluid_ounce) ==
               {:fluid_ounce, 150.75}
    end

    @tag :pending
    test "teaspoon" do
      assert KitchenCalculator.from_millilitre({:millilitre, 61.25}, :teaspoon) ==
               {:teaspoon, 12.25}
    end

    @tag :pending
    test "tablespoon" do
      assert KitchenCalculator.from_millilitre({:millilitre, 71.25}, :tablespoon) ==
               {:tablespoon, 4.75}
    end
  end

  describe "convert from x to y:" do
    @tag :pending
    test "teaspoon to tablespoon" do
      assert KitchenCalculator.convert({:teaspoon, 15}, :tablespoon) == {:tablespoon, 5}
    end

    @tag :pending
    test "cups to fluid ounces" do
      assert KitchenCalculator.convert({:cup, 4}, :fluid_ounce) == {:fluid_ounce, 32}
    end

    @tag :pending
    test "fluid ounces to teaspoons" do
      assert KitchenCalculator.convert({:fluid_ounce, 4}, :teaspoon) == {:teaspoon, 24}
    end

    @tag :pending
    test "tablespoons to cups" do
      assert KitchenCalculator.convert({:tablespoon, 320}, :cup) == {:cup, 20}
    end
  end
end
