defmodule BoutiqueSuggestionsTest do
  use ExUnit.Case

  @tag task_id: 1
  test "generates one pair from one top and one bottom" do
    top = %{
      item_name: "Long Sleeve T-shirt",
      price: 19.95,
      quantity: 15,
      color: "Deep Red",
      base_color: "red"
    }

    bottom = %{
      item_name: "Wonderwall Pants",
      price: 48.97,
      quantity: 3,
      color: "French Navy",
      base_color: "blue"
    }

    assert BoutiqueSuggestions.get_combinations([top], [bottom]) == [{top, bottom}]
  end

  @tag task_id: 1
  test "generates all pairs from two top and two bottom" do
    top1 = %{
      item_name: "Long Sleeve T-shirt",
      price: 19.95,
      quantity: 15,
      color: "Deep Red",
      base_color: "red"
    }

    top2 = %{
      item_name: "Brushwood Shirt",
      price: 19.10,
      quantity: 10,
      color: "Camel-Sandstone Woodland Plaid",
      base_color: "brown"
    }

    bottom1 = %{
      item_name: "Wonderwall Pants",
      price: 48.97,
      quantity: 3,
      color: "French Navy",
      base_color: "blue"
    }

    bottom2 = %{
      item_name: "Terrena Stretch Pants",
      price: 79.95,
      quantity: 7,
      color: "Cast Iron",
      base_color: "grey"
    }

    tops = [top1, top2]
    bottoms = [bottom1, bottom2]
    expected = [{top1, bottom1}, {top1, bottom2}, {top2, bottom1}, {top2, bottom2}]
    assert BoutiqueSuggestions.get_combinations(tops, bottoms) == expected
  end

  @tag task_id: 2
  test "does not create suggestions that 'clash'" do
    top = %{
      item_name: "Long Sleeve T-shirt",
      price: 19.95,
      quantity: 15,
      color: "Deep Red",
      base_color: "red"
    }

    bottom = %{
      item_name: "Happy Hike Studio Pants",
      price: 99.00,
      quantity: 8,
      color: "Ochre Red",
      base_color: "red"
    }

    assert BoutiqueSuggestions.get_combinations([top], [bottom]) == []
  end

  @tag task_id: 3
  test "accepts keyword list for third argument for options" do
    assert BoutiqueSuggestions.get_combinations([], [], maximum_price: 200.00)
  end

  @tag task_id: 3
  test "filter rejects combinations based on combined maximum price" do
    top = %{
      item_name: "Sano Long Sleeve Shirt",
      price: 45.47,
      quantity: 3,
      color: "Linen Chambray",
      base_color: "yellow"
    }

    bottom = %{
      item_name: "Happy Hike Studio Pants",
      price: 99.00,
      quantity: 8,
      color: "Ochre Red",
      base_color: "red"
    }

    assert BoutiqueSuggestions.get_combinations([top], [bottom], maximum_price: 100.00) == []
  end

  @tag task_id: 3
  test "filter accepts combinations based on combined maximum price" do
    top = %{
      item_name: "Sano Long Sleeve Shirt",
      price: 45.47,
      quantity: 3,
      color: "Linen Chambray",
      base_color: "yellow"
    }

    bottom = %{
      item_name: "Happy Hike Studio Pants",
      price: 99.00,
      quantity: 8,
      color: "Ochre Red",
      base_color: "red"
    }

    assert BoutiqueSuggestions.get_combinations([top], [bottom], maximum_price: 200.00) == [
             {top, bottom}
           ]
  end

  @tag task_id: 3
  test "provides default when maximum_price option not specified" do
    top = %{
      item_name: "Sano Long Sleeve Shirt",
      price: 45.47,
      quantity: 3,
      color: "Linen Chambray",
      base_color: "yellow"
    }

    bottom = %{
      item_name: "Happy Hike Studio Pants",
      price: 99.00,
      quantity: 8,
      color: "Ochre Red",
      base_color: "red"
    }

    assert BoutiqueSuggestions.get_combinations([top], [bottom], other_option: "test") == []
  end

  @tag task_id: 3
  test "putting it all together" do
    top1 = %{
      item_name: "Long Sleeve T-shirt",
      price: 19.95,
      quantity: 15,
      color: "Deep Red",
      base_color: "red"
    }

    top2 = %{
      item_name: "Brushwood Shirt",
      price: 19.10,
      quantity: 10,
      color: "Camel-Sandstone Woodland Plaid",
      base_color: "brown"
    }

    top3 = %{
      item_name: "Sano Long Sleeve Shirt",
      price: 45.47,
      quantity: 3,
      color: "Linen Chambray",
      base_color: "yellow"
    }

    bottom1 = %{
      item_name: "Wonderwall Pants",
      price: 48.97,
      quantity: 3,
      color: "French Navy",
      base_color: "blue"
    }

    bottom2 = %{
      item_name: "Terrena Stretch Pants",
      price: 79.95,
      quantity: 7,
      color: "Cast Iron",
      base_color: "grey"
    }

    bottom3 = %{
      item_name: "Happy Hike Studio Pants",
      price: 99.00,
      quantity: 8,
      color: "Ochre Red",
      base_color: "red"
    }

    tops = [top1, top2, top3]
    bottoms = [bottom1, bottom2, bottom3]

    expected = [
      {top1, bottom1},
      {top1, bottom2},
      {top2, bottom1},
      {top2, bottom2},
      {top3, bottom1}
    ]

    assert BoutiqueSuggestions.get_combinations(tops, bottoms) == expected
  end
end
