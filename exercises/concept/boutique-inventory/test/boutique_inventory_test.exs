defmodule BoutiqueInventoryTest do
  use ExUnit.Case

  describe "sort_by_price/1" do
    @tag task_id: 1
    test "works for an empty inventory" do
      assert BoutiqueInventory.sort_by_price([]) == []
    end

    @tag task_id: 1
    test "sorts items by price" do
      assert BoutiqueInventory.sort_by_price([
               %{price: 65, name: "Maxi Yellow Summer Dress", quantity_by_size: %{}},
               %{price: 60, name: "Cream Linen Pants", quantity_by_size: %{}},
               %{price: 33, name: "Straw Hat", quantity_by_size: %{}}
             ]) == [
               %{price: 33, name: "Straw Hat", quantity_by_size: %{}},
               %{price: 60, name: "Cream Linen Pants", quantity_by_size: %{}},
               %{price: 65, name: "Maxi Yellow Summer Dress", quantity_by_size: %{}}
             ]
    end

    @tag task_id: 1
    test "the order of items of equal price is preserved" do
      assert BoutiqueInventory.sort_by_price([
               %{price: 65, name: "Maxi Yellow Summer Dress", quantity_by_size: %{}},
               %{price: 60, name: "Cream Linen Pants", quantity_by_size: %{}},
               %{price: 33, name: "Straw Hat", quantity_by_size: %{}},
               %{price: 60, name: "Brown Linen Pants", quantity_by_size: %{}}
             ]) == [
               %{price: 33, name: "Straw Hat", quantity_by_size: %{}},
               %{price: 60, name: "Cream Linen Pants", quantity_by_size: %{}},
               %{price: 60, name: "Brown Linen Pants", quantity_by_size: %{}},
               %{price: 65, name: "Maxi Yellow Summer Dress", quantity_by_size: %{}}
             ]
    end
  end

  describe "with_missing_price/1" do
    @tag task_id: 2
    test "works for an empty inventory" do
      assert BoutiqueInventory.with_missing_price([]) == []
    end

    @tag task_id: 2
    test "filters out items that do have a price" do
      assert BoutiqueInventory.with_missing_price([
               %{name: "Red Flowery Top", price: 50, quantity_by_size: %{}},
               %{name: "Purple Flowery Top", price: nil, quantity_by_size: %{}},
               %{name: "Bamboo Socks Avocado", price: 10, quantity_by_size: %{}},
               %{name: "Bamboo Socks Palm Trees", price: 10, quantity_by_size: %{}},
               %{name: "Bamboo Socks Kittens", price: nil, quantity_by_size: %{}}
             ]) == [
               %{name: "Purple Flowery Top", price: nil, quantity_by_size: %{}},
               %{name: "Bamboo Socks Kittens", price: nil, quantity_by_size: %{}}
             ]
    end
  end

  describe "increase_quantity/2" do
    @tag task_id: 3
    test "works for an empty quantity map" do
      assert BoutiqueInventory.increase_quantity(
               %{
                 name: "Long Black Evening Dress",
                 price: 105,
                 quantity_by_size: %{}
               },
               1
             ) == %{
               name: "Long Black Evening Dress",
               price: 105,
               quantity_by_size: %{}
             }
    end

    @tag task_id: 3
    test "increases quantity of an item" do
      assert BoutiqueInventory.increase_quantity(
               %{
                 name: "Green Swimming Shorts",
                 price: 46,
                 quantity_by_size: %{s: 1, m: 2, l: 4, xl: 1}
               },
               3
             ) == %{
               name: "Green Swimming Shorts",
               price: 46,
               quantity_by_size: %{s: 4, m: 5, l: 7, xl: 4}
             }
    end
  end

  describe "total_quantity/1" do
    @tag task_id: 4
    test "works for an empty quantity map" do
      assert BoutiqueInventory.total_quantity(%{
               name: "Red Denim Pants",
               price: 77,
               quantity_by_size: %{}
             }) == 0
    end

    @tag task_id: 4
    test "sums up total quantity" do
      assert BoutiqueInventory.total_quantity(%{
               name: "Black Denim Skirt",
               price: 50,
               quantity_by_size: %{s: 4, m: 11, l: 6, xl: 8}
             }) == 29
    end
  end
end
