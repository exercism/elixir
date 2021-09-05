defmodule KitchenCalculatorTest do
  use ExUnit.Case

  describe "get volume from tuple pair" do
    @tag task_id: 1
    test "get cups" do
      assert KitchenCalculator.get_volume({:cup, 1}) == 1
    end

    @tag task_id: 1
    test "get fluid ounces" do
      assert KitchenCalculator.get_volume({:fluid_ounce, 2}) == 2
    end

    @tag task_id: 1
    test "get teaspoons" do
      assert KitchenCalculator.get_volume({:teaspoon, 3}) == 3
    end

    @tag task_id: 1
    test "get tablespoons" do
      assert KitchenCalculator.get_volume({:tablespoon, 4}) == 4
    end

    @tag task_id: 1
    test "get milliliters" do
      assert KitchenCalculator.get_volume({:milliliter, 5}) == 5
    end
  end

  describe "convert to milliliters from" do
    @tag task_id: 2
    test "milliliters" do
      assert KitchenCalculator.to_milliliter({:milliliter, 3}) == {:milliliter, 3}
    end

    @tag task_id: 2
    test "cups" do
      assert KitchenCalculator.to_milliliter({:cup, 3}) == {:milliliter, 720}
    end

    @tag task_id: 2
    test "fluid ounces" do
      assert KitchenCalculator.to_milliliter({:fluid_ounce, 100}) == {:milliliter, 3000}
    end

    @tag task_id: 2
    test "teaspoon" do
      assert KitchenCalculator.to_milliliter({:teaspoon, 3}) == {:milliliter, 15}
    end

    @tag task_id: 2
    test "tablespoon" do
      assert KitchenCalculator.to_milliliter({:tablespoon, 3}) == {:milliliter, 45}
    end
  end

  describe "convert from milliliters to" do
    @tag task_id: 3
    test "milliliters" do
      assert KitchenCalculator.from_milliliter({:milliliter, 4}, :milliliter) == {:milliliter, 4}
    end

    @tag task_id: 3
    test "cups" do
      assert KitchenCalculator.from_milliliter({:milliliter, 840}, :cup) == {:cup, 3.5}
    end

    @tag task_id: 3
    test "fluid ounces" do
      assert KitchenCalculator.from_milliliter({:milliliter, 4522.5}, :fluid_ounce) ==
               {:fluid_ounce, 150.75}
    end

    @tag task_id: 3
    test "teaspoon" do
      assert KitchenCalculator.from_milliliter({:milliliter, 61.25}, :teaspoon) ==
               {:teaspoon, 12.25}
    end

    @tag task_id: 3
    test "tablespoon" do
      assert KitchenCalculator.from_milliliter({:milliliter, 71.25}, :tablespoon) ==
               {:tablespoon, 4.75}
    end
  end

  describe "convert from x to y:" do
    @tag task_id: 4
    test "teaspoon to tablespoon" do
      assert KitchenCalculator.convert({:teaspoon, 15}, :tablespoon) == {:tablespoon, 5}
    end

    @tag task_id: 4
    test "cups to fluid ounces" do
      assert KitchenCalculator.convert({:cup, 4}, :fluid_ounce) == {:fluid_ounce, 32}
    end

    @tag task_id: 4
    test "fluid ounces to teaspoons" do
      assert KitchenCalculator.convert({:fluid_ounce, 4}, :teaspoon) == {:teaspoon, 24}
    end

    @tag task_id: 4
    test "tablespoons to cups" do
      assert KitchenCalculator.convert({:tablespoon, 320}, :cup) == {:cup, 20}
    end
  end
end
