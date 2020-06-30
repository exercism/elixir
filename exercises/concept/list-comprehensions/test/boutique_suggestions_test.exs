defmodule BoutiqueSuggestionsTest do
  use ExUnit.Case

  @top1 %{
      item_name: "Long Sleeve T-shirt",
      price: 19.95,
      quantity: 15,
      color: "Deep Red",
      base_color: "red"
    }

  @top2 %{
      item_name: "Brushwood Shirt",
      price: 19.10,
      quantity: 10,
      color: "Camel-Sandstone Woodland Plaid",
      base_color: "brown"
    }

  @top3 %{
      item_name: "Sano Long Sleeve Shirt",
      price: 45.47,
      quantity: 3,
      color: "Linen Chambray",
      base_color: "yellow"
    }

  @all_tops [@top1, @top2, @top3]

  @bottom1 %{
      item_name: "Wonderwall Pants",
      price: 48.97,
      quantity: 3,
      color: "French Navy",
      base_color: "blue"
    }

  @bottom2 %{
      item_name: "Terrena Stretch Pants",
      price: 79.95,
      quantity: 7,
      color: "Cast Iron",
      base_color: "grey"
    }

  @bottom3 %{
      item_name: "Happy Hike Studio Pants",
      price: 99.00,
      quantity: 8,
      color: "Ochre Red",
      base_color: "red"
    }

  @all_bottoms [@bottom1, @bottom2, @bottom3]

  test "generates one pair from one top and one bottom" do
    assert BoutiqueSuggestions.get_combinations([@top1], [@bottom1]) == [{@top1, @bottom1}]
  end

  test "generates all pairs from two top and two bottom" do
    tops = [@top1, @top2]
    bottoms = [@bottom1, @bottom2]
    expected = [{@top1, @bottom1},{@top1, @bottom2},{@top2, @bottom1},{@top2, @bottom2}]
    assert BoutiqueSuggestions.get_combinations(tops, bottoms) == expected
  end

  test "does not create suggestions that 'clash'" do
    assert BoutiqueSuggestions.get_combinations([@top1], [@bottom3]) == []
  end

  test "accepts keyword list for third argument for options" do
    assert BoutiqueSuggestions.get_combinations([], [], maximum_price: 200.00)
  end

  test "filter rejects combinations based on combined maximum price" do
    assert BoutiqueSuggestions.get_combinations([@top3], [@bottom3], maximum_price: 100.00) == []
  end

  test "filter accepts combinations based on combined maximum price" do
    assert BoutiqueSuggestions.get_combinations([@top3], [@bottom3], maximum_price: 200.00) == [{@top3, @bottom3}]
  end

  test "provides default when maximum_price option not specified" do
    assert BoutiqueSuggestions.get_combinations([@top3], [@bottom3], other_option: "test") == []
  end

  test "putting it all together" do
    expected = [
      {@top1, @bottom1},
      {@top1, @bottom2},
      {@top2, @bottom1},
      {@top2, @bottom2},
      {@top3, @bottom1}
    ]

    assert BoutiqueSuggestions.get_combinations(@all_tops, @all_bottoms) == expected
  end
end
