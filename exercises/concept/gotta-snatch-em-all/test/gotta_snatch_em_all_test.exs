defmodule GottaSnatchEmAllTest do
  use ExUnit.Case

  describe "new_collection/1" do
    @tag task_id: 1
    test "creates a singleton" do
      assert GottaSnatchEmAll.new_collection("Bleakachu") == MapSet.new(["Bleakachu"])
    end

    @tag task_id: 1
    test "creates another singleton" do
      assert GottaSnatchEmAll.new_collection("Shiny Bleakachu") == MapSet.new(["Shiny Bleakachu"])
    end
  end

  describe "add_card/2" do
    @tag task_id: 2
    test "adds card to an empty collection" do
      empty = MapSet.new()
      assert GottaSnatchEmAll.add_card("Veevee", empty) == {false, MapSet.new(["Veevee"])}
    end

    @tag task_id: 2
    test "adds card to a collection that doesn't have the card" do
      collection = MapSet.new(["Bleakachu"])

      assert GottaSnatchEmAll.add_card("Veevee", collection) ==
               {false, MapSet.new(["Bleakachu", "Veevee"])}
    end

    @tag task_id: 2
    test "adds card to a collection that already has the card" do
      collection = MapSet.new(["Veevee"])

      assert GottaSnatchEmAll.add_card("Veevee", collection) ==
               {true, MapSet.new(["Veevee"])}
    end

    @tag task_id: 2
    test "adds card to larger collection that already has the card" do
      collection = MapSet.new(["Bleakachu", "Veevee"])

      assert GottaSnatchEmAll.add_card("Veevee", collection) ==
               {true, MapSet.new(["Bleakachu", "Veevee"])}
    end
  end

  describe "trade_card/3" do
    @tag task_id: 3
    test "trades card to an empty collection" do
      empty = MapSet.new()

      assert GottaSnatchEmAll.trade_card("Charilord", "Gyros", empty) ==
               {false, MapSet.new(["Gyros"])}
    end

    @tag task_id: 3
    test "trades a card I don't have for a card I don't have" do
      collection = MapSet.new(["Bleakachu"])

      assert GottaSnatchEmAll.trade_card("Charilord", "Gyros", collection) ==
               {false, MapSet.new(["Bleakachu", "Gyros"])}
    end

    @tag task_id: 3
    test "trades a card I don't have for a card I have" do
      collection = MapSet.new(["Gyros"])

      assert GottaSnatchEmAll.trade_card("Charilord", "Gyros", collection) ==
               {false, MapSet.new(["Gyros"])}
    end

    @tag task_id: 3
    test "trades a card I have for a card I have" do
      collection = MapSet.new(["Charilord", "Gyros"])

      assert GottaSnatchEmAll.trade_card("Charilord", "Gyros", collection) ==
               {false, MapSet.new(["Gyros"])}
    end

    @tag task_id: 3
    test "trades a card I have for a card I don't have" do
      collection = MapSet.new(["Charilord"])

      assert GottaSnatchEmAll.trade_card("Charilord", "Gyros", collection) ==
               {true, MapSet.new(["Gyros"])}
    end

    @tag task_id: 3
    test "trades a card I have for a card I don't have in a larger collection" do
      collection = MapSet.new(["Charilord", "Bleakachu", "Veevee"])

      assert GottaSnatchEmAll.trade_card("Charilord", "Gyros", collection) ==
               {true, MapSet.new(["Gyros", "Bleakachu", "Veevee"])}
    end
  end

  describe "remove_duplicates/1" do
    @tag task_id: 4
    test "removes duplicates from an empty list" do
      assert GottaSnatchEmAll.remove_duplicates([]) == []
    end

    @tag task_id: 4
    test "removes duplicates from a singleton list" do
      list = ["Wigglycream"]
      assert GottaSnatchEmAll.remove_duplicates(list) == list
    end

    @tag task_id: 4
    test "removes duplicates from a list with the same card many times over" do
      list = ["Wigglycream", "Wigglycream", "Wigglycream"]
      assert GottaSnatchEmAll.remove_duplicates(list) == ["Wigglycream"]
    end

    @tag task_id: 4
    test "removes duplicates from a list with many cards" do
      list = [
        "Quarterpie",
        "Wigglycream",
        "Cooltentbrov",
        "Mayofried",
        "Wigglycream",
        "Cooltentbrov",
        "Cooltentbrov"
      ]

      assert GottaSnatchEmAll.remove_duplicates(list) == [
               "Cooltentbrov",
               "Mayofried",
               "Quarterpie",
               "Wigglycream"
             ]
    end
  end

  describe "extra_cards/2" do
    @tag task_id: 5
    test "counts extra cards of empty collections" do
      a = MapSet.new()
      b = MapSet.new()

      assert GottaSnatchEmAll.extra_cards(a, b) == 0
    end

    @tag task_id: 5
    test "counts extra cards of singleton vs empty collection" do
      a = MapSet.new(["Shazam"])
      b = MapSet.new()

      assert GottaSnatchEmAll.extra_cards(a, b) == 1
    end

    @tag task_id: 5
    test "counts extra cards of empty collection vs singleton" do
      a = MapSet.new()
      b = MapSet.new(["Shazam"])

      assert GottaSnatchEmAll.extra_cards(a, b) == 0
    end

    @tag task_id: 5
    test "counts extra cards of same collection" do
      a = MapSet.new(["Shazam", "Wigglycream"])
      b = MapSet.new(["Shazam", "Wigglycream"])

      assert GottaSnatchEmAll.extra_cards(a, b) == 0
    end

    @tag task_id: 5
    test "counts extra cards of two different collections" do
      a = MapSet.new(["Shazam", "Cooltentbro", "Wigglycream"])
      b = MapSet.new(["Gyros", "Wigglycream"])

      assert GottaSnatchEmAll.extra_cards(a, b) == 2
    end

    @tag task_id: 5
    test "counts extra cards of reversed collections" do
      a = MapSet.new(["Gyros", "Wigglycream"])
      b = MapSet.new(["Shazam", "Cooltentbro", "Wigglycream"])

      assert GottaSnatchEmAll.extra_cards(a, b) == 1
    end
  end

  describe "boring_cards/1" do
    @tag task_id: 6
    test "finds boring cards of no collection" do
      assert GottaSnatchEmAll.boring_cards([]) == []
    end

    @tag task_id: 6
    test "finds boring cards of empty collections" do
      a = MapSet.new()
      b = MapSet.new()

      assert GottaSnatchEmAll.boring_cards([a, b]) == []
    end

    @tag task_id: 6
    test "finds boring cards of singleton and empty collection" do
      a = MapSet.new(["Shazam"])
      b = MapSet.new()

      assert GottaSnatchEmAll.boring_cards([a, b]) == []
    end

    @tag task_id: 6
    test "finds boring cards of identical collections" do
      a = MapSet.new(["Shazam", "Wigglycream"])
      b = MapSet.new(["Shazam", "Wigglycream"])

      assert GottaSnatchEmAll.boring_cards([a, b]) == ["Shazam", "Wigglycream"]
    end

    @tag task_id: 6
    test "finds boring cards of collections with no overlap" do
      a = MapSet.new(["Gyros", "Wigglycream", "Veevee"])
      b = MapSet.new(["Bleakachu", "Veevee"])
      c = MapSet.new(["Shazam", "Gyros", "Cooltentbro", "Wigglycream"])

      assert GottaSnatchEmAll.boring_cards([a, b, c]) == []
    end

    @tag task_id: 6
    test "finds boring cards of collections with some overlap" do
      a = MapSet.new(["Gyros", "Wigglycream", "Veevee"])
      b = MapSet.new(["Gyros", "Bleakachu", "Veevee"])
      c = MapSet.new(["Gyros", "Shazam", "Gyros", "Veevee", "Cooltentbro", "Wigglycream"])

      assert GottaSnatchEmAll.boring_cards([a, b, c]) == ["Gyros", "Veevee"]
    end
  end

  describe "total_cards/1" do
    @tag task_id: 7
    test "counts total cards of no collection" do
      assert GottaSnatchEmAll.total_cards([]) == 0
    end

    @tag task_id: 7
    test "counts total cards of single collection input" do
      a = MapSet.new(["Shazam", "Wigglycream"])

      assert GottaSnatchEmAll.total_cards([a]) == 2
    end

    @tag task_id: 7
    test "counts total cards of empty collections" do
      a = MapSet.new()
      b = MapSet.new()

      assert GottaSnatchEmAll.total_cards([a, b]) == 0
    end

    @tag task_id: 7
    test "counts total cards of singleton and empty collection" do
      a = MapSet.new(["Shazam"])
      b = MapSet.new()

      assert GottaSnatchEmAll.total_cards([a, b]) == 1
    end

    @tag task_id: 7
    test "counts total cards of same collections" do
      a = MapSet.new(["Shazam", "Wigglycream"])
      b = MapSet.new(["Shazam", "Wigglycream"])

      assert GottaSnatchEmAll.total_cards([a, b]) == 2
    end

    @tag task_id: 7
    test "counts total cards of two collections" do
      a = MapSet.new(["Shazam", "Cooltentbro", "Wigglycream"])
      b = MapSet.new(["Gyros", "Wigglycream"])

      assert GottaSnatchEmAll.total_cards([a, b]) == 4
    end

    @tag task_id: 7
    test "counts total cards of three collections" do
      a = MapSet.new(["Gyros", "Wigglycream", "Veevee"])
      b = MapSet.new(["Bleakachu", "Veevee"])
      c = MapSet.new(["Shazam", "Gyros", "Cooltentbro", "Wigglycream"])

      assert GottaSnatchEmAll.total_cards([a, b, c]) == 6
    end
  end

  describe "split_shiny_cards/1" do
    @tag task_id: 8
    test "splits shiny cards of empty collection" do
      empty = MapSet.new()

      assert GottaSnatchEmAll.split_shiny_cards(empty) == {[], []}
    end

    @tag task_id: 8
    test "splits shiny cards with one normal card" do
      collection = MapSet.new(["Blasturtle"])

      assert GottaSnatchEmAll.split_shiny_cards(collection) ==
               {[], ["Blasturtle"]}
    end

    @tag task_id: 8
    test "splits shiny cards with one shiny card" do
      collection = MapSet.new(["Shiny Hitmonchuck"])

      assert GottaSnatchEmAll.split_shiny_cards(collection) ==
               {["Shiny Hitmonchuck"], []}
    end

    @tag task_id: 8
    test "splits shiny cards with many cards" do
      collection =
        MapSet.new([
          "Shiny Hitmonchuck",
          "Blasturtle",
          "Shiny Shazam",
          "Shiny Phiswan",
          "Zumbat",
          "Hitmonchuck"
        ])

      assert GottaSnatchEmAll.split_shiny_cards(collection) == {
               ["Shiny Hitmonchuck", "Shiny Phiswan", "Shiny Shazam"],
               ["Blasturtle", "Hitmonchuck", "Zumbat"]
             }
    end
  end
end
